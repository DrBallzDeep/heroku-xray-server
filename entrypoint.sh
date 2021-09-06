#!/bin/sh

#Config xray
rm -rf //etc/xray/config.json
cat << EOF > //etc/xray/config.json
{
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "vless",
      "settings": {
        "decryption": "none",
        "clients": [
          {
            "id": "fca71b47-6ffd-4eb1-9af7-226dbd2c26cc"
          }
        ]
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

#run xray

xray -c //etc/xray/config.json
