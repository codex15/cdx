import socket
import threading
import sys

def ssh_scan(ip, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(5)
    try:
        sock.connect((ip, port))
        sock.send(b'\x00\x00\x00\x07ssh-keyscan')
        data = sock.recv(1024)
        if data:
            print(f"[+] {ip}:{port} - SSH Key found: {data}")
        else:
            print(f"[-] {ip}:{port} - No SSH Key found")
    except:
        print(f"[-] {ip}:{port} - Connection refused")
    finally:
        sock.close()

def main():
    if len(sys.argv) < 2:
        print("[-] Please provide a file with IPs")
        sys.exit()

    filename = sys.argv[1]
    with open(filename, 'r') as f:
        ip_list = f.readlines()

    for ip in ip_list:
        t = threading.Thread(target=ssh_scan, args=(ip.strip(), 22))
        t.start()

if __name__ == '__main__':
    main()
