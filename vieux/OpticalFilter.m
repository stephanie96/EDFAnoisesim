function SignalVector= OpticalFilter(SignalVector, SignalVectorSize)
%   /* Digital filter designed by mkfilter/mkshape/gencode   A.J. Fisher
%   Command line: /www/usr/fisher/helpers/mkfilter -Bu -Lp -o 2 -a 1.5625000000e-02 0.0000000000e+00 -l
% 
%   filtertype    =    Butterworth 
%    passtype    =    Lowpass 
%    order    =    2 
%    samplerate    =    6.4E11 	= 2^6/ bit slot
%    corner1    =    25E9
%   */

  NZEROS= 2;
  NPOLES= 2;
  oGAIN= 7.820233128e+01;
  xv= zeros(NZEROS+ 1);
  yv= zeros(NPOLES+1);

  for i=1: SignalVectorSize
    xv(1)= xv(2); xv(2) = xv(3); 
    xv(3)= SignalVector(i)/ oGAIN;
    yv(1)= yv(2); yv(2) = yv(3); 
    yv(3)= (xv(1)+ xv(3) )+ 2* xv(2)+ (-0.7067570632* yv(1) )+ (1.6556076929* yv(2) );
    SignalVector(i)= yv(3);
  end