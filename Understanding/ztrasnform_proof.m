syms a n z
assume(a > 0)
iz=iztrans(1/(z-a),z,n);
iz = simplify(iz)