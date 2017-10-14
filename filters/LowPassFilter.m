function signal=LowPassFilter(signal,window)

    sric=signal;
 
    fun=zeros(size(sric));
    
    v=mod(length(fun),2);
    Nf=length(fun)+v;
    fun([Nf/2-window:Nf/2+window])=1;
    signal=real(ifft( ifftshift( fftshift(fft( sric)).*fun)));
    
end