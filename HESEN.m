## Copyright (C) 2018 Raul
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} HESEN (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Raul <raul@raul-Satellite-C55-B>
## Created: 2018-10-29

function HESEN
  A=input('INGRESE MATRIZ');
  AA=A;
  b=input('íngrese vector');
  [n m]=size(A);
  P=eye(n);
  for i=2:n-1
    x=A(i:n,i-1);
    u=x+norm(x)*eye(n+1-i,1);
    HH=eye(n+1-i)-(2/(u'*u))*(u*u');
    H=[eye(i-1,n);zeros(n+1-i,i-1) HH];
    P=P*H;
    A=H*A*H';
  endfor

  P  
  P*A*P'
  A%matriz de hessenberg
  HES=A
  disp("Eliminacion gausiana")
  for i=2:n
    for j=i:n
      A(i,j)=A(i,j)-(A(i,i-1)/A(i-1,i-1))*A(i-1,j);
     endfor
     A(i,i-1)=0;
  endfor
  BB=(P')*b
  disp("hallar y")
  Y=zeros(size(BB),1)
  nv=size(BB)
  nv=nv(1)
  nnn=nv
  nv=BB(nv)/A(nv,nv)

  Y(nnn)=nv
  sumatoria=0                                                                                 
  for n=size(BB)-1:-1:1
        for j=n+1:size(BB)    
            sumatoria=A(n,j)*Y(j)+sumatoria
        end
        Y(n)=(1/A(n,n))*(BB(n)-sumatoria)
        sumatoria=0;
  end

  disp("Y es igual a ")
  Y
  P
  disp("hallar X")
  X=P*Y
  disp("comprobacion ")
  AA*X	
endfunction
