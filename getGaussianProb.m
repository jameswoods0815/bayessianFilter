function p=getGaussianProb(mu,sigma, x,detSig,invSig)
[m,n]=size(sigma);
dimension=m;
p=1/(sqrt((2*pi)^dimension*abs(detSig)))*exp(-0.5*(x-mu)*invSig*(x-mu)');

end