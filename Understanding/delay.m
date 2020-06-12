syms s t z k
d = 0.1;

y(t) = ilaplace(exp(-1*s)/s)
y(k) = subs(y(t),t,d*k)
Y(z) = ztrans(y(k))
G(z) = simplify((z-1)/z*Y(z))

s = tf('s')
G_s = exp(-10*d*s);
G_z = c2d(G_s,d,'zoh')

G_s = (1/s-1/(s+20))*s*exp(-20*s)
G_z = c2d(G_s,d,'zoh')
