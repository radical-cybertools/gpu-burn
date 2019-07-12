
again: all
all:
	nvcc -I${CUDAPATH}/include -arch=compute_30 -ptx compare.cu -o compare.ptx
	g++ -std=c++11 -O3 -I${CUDAPATH}/include -c gpu_burn-drv.cpp
	g++ -std=c++11 -o gpu_burn gpu_burn-drv.o -O3 -lcuda -L${CUDAPATH}/lib64 -L${CUDAPATH}/lib -Wl,-rpath=${CUDAPATH}/lib64 -Wl,-rpath=${CUDAPATH}/lib -lcublas -lcudart -o gpu_burn

clean:
	@rm -vf *.o *.ptx

distclean: clean
	@rm -vrf gpu_burn

