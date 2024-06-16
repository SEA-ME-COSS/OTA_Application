import socket
import paho.mqtt.client as mqtt
import hashlib
import json

Sub_topic = "ota/update"
brokerIp = "127.0.0.1"
port = 1883

download_path = "./download"

# ecu_ip
# ecu_port

def on_message(client, userdata, msg):
    payload = json.loads(msg.payload.decode())
    url = payload['url']
    compare_hash = payload['checksum']
    download_file(url, compare_hash)

def download_file(url, compare_hash):
    try:
        response = requests.get(url)
        
        with open(download_path, 'wb') as file:
            file.write(response.content)
        
        integrity_check(compare_hash)
    
    except Exception as e:
        print(f"Error : {e}")

def integrity_check(compare_hash):
    try:
        sha256_hash = hashlib.sha256()

        with open(download_path, "rb") as file:
            for byte_block in iter(lambda: file.read(4096), b""):
                sha256_hash.update(byte_block)
        
        calculated_hash = sha256_hash.hexdigest()

        if calculated_hash == expected_hash:
            print("Integrity Check Pass")
            send_file(download_path)
        else:
            print("Integrity Check Fail")
    
    except Exception as e:
        print(f"Error : {e}")


def send_file(file_path):
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect(ecu_ip, ecu_port)
            with open(file_path, "rb") as file:
                s.sendfile(file)

            print("Send Success")

    except Exception as e:
        print(f"Error : {e}")

def main(args=None):
    client = mqtt.Client()
    client.on_message = on_message

    client.connect(brokerIp, port, 60)
    clinet.subscribe(topic)

    client.loop_forever()

if __name__ == '__main__':
    main();
