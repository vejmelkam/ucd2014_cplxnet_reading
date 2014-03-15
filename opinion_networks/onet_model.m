
%
%  Computes the derivatives specified by the ODE model in the Naming game,
%  for easy use in integrators, na and nb are assembled as ab=[na,nb]' and
%  the derivative is returned as a vector dab = [dna/dt,dnb/dt]'.
%
%  synopsis: [dab] = xie2012_model(pa,pb,ab)
%

function dab = onet_model(pa,pb,ab)
    na = ab(1);
    nb = ab(2);
    nab = 1 - na - nb - pa - pb;
    dna = -na*nb + nab^2 + na*nab + 1.5*pa*nab-pb*na;
    dnb = -na*nb + nab^2 + nb*nab + 1.5*pb*nab-pa*nb;
    dab = [dna,dnb]';
end
