function [dm, dj] = sched(pijk, sijk, O)

for i=1:max(O)
    d = 0
    dmk = 0
    djj = 0
    E= zeros(20,9)
    S= zeros(20,9)
%     E= zeros(3,4)
%     S= zeros(3,4)
    for j=1:colE
        if O(j) >= i
            row=i+sum(O(1:(j-1)))
            E(j,:)=pijk(row,:)
            S(j,:)=sijk(row,:);
            [maxS, idxS] = max(S(j,:))
            d(j)=E(j,idxS)
            dmk(j) = idxS
        end
    end
    % · classify the operation of E according to SPT
    djj = find(d)
    d(d==0) = []
    dmk(dmk==0) = []
    [durut, idxd]=sort(d);
    % · for j=1 ; 1<=<=N
    for j = 1:colX
        % · calculate starting time
        t(i,j) = max(dm(dmk(idxd(j))), dj(djj(idxd(j))))
        % · update dm
        dm(dmk(idxd(j))) = t(i,j) + durut(j)
        % · update dj
        dj(djj(idxd(j))) = t(i,j) + durut(j)
    end
    X=X-1;
    X(X==0)=[];
    [rowX colX] = size(X);
end