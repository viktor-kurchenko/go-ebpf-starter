headers:
	bpftool btf dump file /sys/kernel/btf/vmlinux format c > bpf/vmlinux.h

compile-c:
	clang -target bpf -Wall -O2 -g -c bpf/app.c -I/usr/include -o bpf/app.o

go-generate:
	go generate ./...

run:
	sudo go run . wlp1s0
