load('test_file.mat')

opts.steps      = 20; % default 20 ; reduced for time
opts.hyp.a0     = 2;
opts.hyp.b0     = 1;
opts.hyp.mu0    = 0;
opts.hyp.kappa0 = 1;

%%
% run the algorithm
[MAP, samples]  = PMC_ddCRP_NG(data(:,:,1)',A',opts);

%%
tmp  = {}
for i = 1:numel(A)
    tmp{i} = sum(A{i} == 0);
end
