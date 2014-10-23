package com.google.android.apps.analytics;

import org.apache.http.impl.*;
import org.apache.http.conn.scheme.*;
import java.io.*;
import org.apache.http.params.*;
import java.net.*;
import android.util.*;
import org.apache.http.*;

class PipelinedRequester
{
    private static final int RECEIVE_BUFFER_SIZE = 8192;
    Callbacks callbacks;
    boolean canPipeline;
    DefaultHttpClientConnection connection;
    HttpHost host;
    int lastStatusCode;
    SocketFactory socketFactory;
    
    public PipelinedRequester(final HttpHost httpHost) {
        this(httpHost, (SocketFactory)new PlainSocketFactory());
    }
    
    public PipelinedRequester(final HttpHost host, final SocketFactory socketFactory) {
        super();
        this.connection = new DefaultHttpClientConnection();
        this.canPipeline = true;
        this.host = host;
        this.socketFactory = socketFactory;
    }
    
    private void closeConnection() {
        if (this.connection == null || !this.connection.isOpen()) {
            return;
        }
        try {
            this.connection.close();
        }
        catch (IOException ex) {}
    }
    
    private void maybeOpenConnection() throws IOException {
        if (this.connection == null || !this.connection.isOpen()) {
            final BasicHttpParams basicHttpParams = new BasicHttpParams();
            final Socket connectSocket = this.socketFactory.connectSocket(this.socketFactory.createSocket(), this.host.getHostName(), this.host.getPort(), (InetAddress)null, 0, (HttpParams)basicHttpParams);
            connectSocket.setReceiveBufferSize(8192);
            this.connection.bind(connectSocket, (HttpParams)basicHttpParams);
        }
    }
    
    public void addRequest(final HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws HttpException, IOException {
        this.maybeOpenConnection();
        this.connection.sendRequestHeader((HttpRequest)httpEntityEnclosingRequest);
        this.connection.sendRequestEntity(httpEntityEnclosingRequest);
    }
    
    public void finishedCurrentRequests() {
        this.closeConnection();
    }
    
    public void installCallbacks(final Callbacks callbacks) {
        this.callbacks = callbacks;
    }
    
    public void sendRequests() throws IOException, HttpException {
        this.connection.flush();
        final HttpConnectionMetrics metrics = this.connection.getMetrics();
        while (metrics.getResponseCount() < metrics.getRequestCount()) {
            final HttpResponse receiveResponseHeader = this.connection.receiveResponseHeader();
            if (!receiveResponseHeader.getStatusLine().getProtocolVersion().greaterEquals((ProtocolVersion)HttpVersion.HTTP_1_1)) {
                this.callbacks.pipelineModeChanged(false);
                this.canPipeline = false;
            }
            final Header[] headers = receiveResponseHeader.getHeaders("Connection");
            if (headers != null) {
                for (int length = headers.length, i = 0; i < length; ++i) {
                    if ("close".equalsIgnoreCase(headers[i].getValue())) {
                        this.callbacks.pipelineModeChanged(false);
                        this.canPipeline = false;
                    }
                }
            }
            this.lastStatusCode = receiveResponseHeader.getStatusLine().getStatusCode();
            if (this.lastStatusCode != 200) {
                this.callbacks.serverError(this.lastStatusCode);
                this.closeConnection();
                break;
            }
            this.connection.receiveResponseEntity(receiveResponseHeader);
            receiveResponseHeader.getEntity().consumeContent();
            this.callbacks.requestSent();
            if (GoogleAnalyticsTracker.getInstance().getDebug()) {
                Log.v("GoogleAnalyticsTracker", "HTTP Response Code: " + receiveResponseHeader.getStatusLine().getStatusCode());
            }
            if (!this.canPipeline) {
                this.closeConnection();
                break;
            }
        }
    }
    
    interface Callbacks
    {
        void pipelineModeChanged(boolean p0);
        
        void requestSent();
        
        void serverError(int p0);
    }
}
