sudo ip netns add ue1
srsue --rf.device_name=zmq --rf.device_args="tx_port=tcp://*:2001,rx_port=tcp://localhost:2000,id=ue,base_srate=23.04e6" --gw.netns=ue1
sudo ip netns exec ue1 ip route add default dev tun_srsue
