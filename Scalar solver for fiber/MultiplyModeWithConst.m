function E3 = MultiplyModeWithConst(c,E1)
E3.x = c*E1.x;
E3.y = c*E1.y;
E3.abs = sqrt(E3.x.^2 + E3.y.^2);
