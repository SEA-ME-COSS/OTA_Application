#include <iostream>
#include <mosquitto.h>

void on_connect(struct mosquitto *mosq, void *userdata, int rc) {
    if (rc == 0) {
        std::cout << "Connected to MQTT broker" << std::endl;
        mosquitto_subscribe(mosq, NULL, "ota/update", 0);
    } else {
        std::cerr << "Failed to connect to MQTT broker" << std::endl;
    }
}

void on_message(struct mosquitto *mosq, void *userdata, const struct mosquitto_message *msg) {
    if (msg->payloadlen) {
        std::string update_url = (char*) msg->payload;
        std::cout << "Received update notification: " << update_url << std::endl;

        std::cout << "Do you want to download the update? (yes/no): ";
        std::string response;
        std::cin >> response;
        if (response == "yes") {
            mosquitto_publish(mosq, NULL, "ota/update_url", update_url.length(), update_url.c_str(), 0, false);
			std::cout << update_url;
        }
    }
}

int main(int argc, char *argv[]) {
    mosquitto_lib_init();

    struct mosquitto *mosq = mosquitto_new(NULL, true, NULL);
    if (!mosq) {
        std::cerr << "Failed to create Mosquitto instance" << std::endl;
        return 1;
    }

    mosquitto_connect_callback_set(mosq, on_connect);
    mosquitto_message_callback_set(mosq, on_message);

    if (mosquitto_connect(mosq, "localhost", 1883, 60) != MOSQ_ERR_SUCCESS) {
        std::cerr << "Failed to connect to MQTT broker" << std::endl;
        return 1;
    }

    mosquitto_loop_forever(mosq, -1, 1);

    mosquitto_destroy(mosq);
    mosquitto_lib_cleanup();

    return 0;
}

