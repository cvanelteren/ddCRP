dataName = '20140805_1_3_cy74_6d_spon_20140805_170009' 
load(strcat('../analysisScripts/', dataName));

    
% n = size(coordinates, 1);
% theta = 10;
% A = {}
% for i = 1 : n
% 	ci = coordinates(i,:);
% 	tmp = norm(ci - coordinates);
% 	idx = find(tmp <= theta && tmp > 0);
% 	A{i} = idx
% end
% assert 0 
%%
n = length(A);

b = {1:(n)};b = b(ones(n,1));
disp('starting')
for i = 1:n
    idx = A{i, 1};
    
    if isempty(b{i}) == 0
        b{i} = double(idx + 1)';
    else
        b{i} =[]
    end
end
   
%% 
% from the provided script (not altered)
opts.steps      = 1; % default 20 ; reduced for time
opts.hyp.a0     = 2;
opts.hyp.b0     = 1;
opts.hyp.mu0    = 0;
opts.hyp.kappa0 = 1;

% run the algorithm
MAP = PMC_ddCRP_NG(data',b,opts); % default

%%
Z = double(bsxfun(@eq,MAP.Pi,1:max(MAP.Pi)));
nClus = unique(MAP.Pi);
clusSize = zeros(length(nClus),1);
pi = MAP.Pi;
for i = 1 : length(nClus)
    clusterSize(i) = numel(find(pi == nClus(i)));
end

