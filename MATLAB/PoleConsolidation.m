function [ polesf ] = PoleConsolidation( polesi )
%POLECONSOLIDATION Takes a set of poles 'polesi' and consolidates them
%Returns a set of poles 'polesf' with all [0,...,0] removed as well as
%duplicate poles averaged

polesi(ismember(polesi,[0,0,0,0,0,0],'rows'),:)=[];

%del = zeros(size(c,1));
radAdj=10;
for i = 1:size(polesi,1)
    j=i+1;
    while j <= size(polesi,1)
        if or(abs(polesi(i,3)-polesi(j,3))<radAdj*polesi(i,5),abs(polesi(i,3)-polesi(j,3))<radAdj*polesi(j,5))
            %del(j)=1;
            %disp(c(j,:));
            polesi(j,:)=[];
        else
            j=j+1;
        end
    end
end
%c(del,:) = [];
polesf = polesi;

end

