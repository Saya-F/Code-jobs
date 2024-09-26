% 读取分布表
j_d = readmatrix('data1.xls');

p_X = sum(j_d, 2); % P(X)
p_Y = sum(j_d, 1); % P(Y)

% 计算 H(X) 和 H(Y)
H_X = -sum(p_X(p_X > 0) .* log2(p_X(p_X > 0)));
H_Y = -sum(p_Y(p_Y > 0) .* log2(p_Y(p_Y > 0)));

% 计算联合熵 H(X, Y)
H_XY = -sum(j_d(j_d > 0) .* log2(j_d(j_d > 0)));

% 计算条件熵 H(X|Y) 和 H(Y|X)
H_X_given_Y = H_XY - H_Y;
H_Y_given_X = H_XY - H_X;

% 计算互信息 I(X, Y)
I_XY = H_X + H_Y - H_XY;

% 输出结果
fprintf('H(X): %.4f\n', H_X);
fprintf('H(Y): %.4f\n', H_Y);
fprintf('H(X, Y): %.4f\n', H_XY);
fprintf('H(X|Y): %.4f\n', H_X_given_Y);
fprintf('H(Y|X): %.4f\n', H_Y_given_X);
fprintf('I(X, Y): %.4f\n', I_XY);
