clear
clc

load('Studio4_Arrays.mat')

[rn,cn]=size(B)

for c=1:cn
    for r=1:rn
        B_trans(c,r)=B(r,c);
    end
end

[rm,cm]=size(B_trans);

B_trans
