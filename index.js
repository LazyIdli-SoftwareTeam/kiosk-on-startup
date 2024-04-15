const io = require('socket.io-client');
const os = require('os');
const wifi = require('node-wifi');

//constants
const socket = io('http://192.168.8.0:8000');
const KIOSKID = 'PTK-001';

socket.on('connect', () => {
  wifi.init();
  setInterval(() => {
    wifi.getCurrentConnections((error, currentConnections) => {
      if (error) {
        socket.emit(
          'health',
          JSON.stringify({
            wifi: false,
            ping: true,
            kioskId: KIOSKID,
            time: new Date(),
            os: {
              uptime: os.uptime(),
              freeMem: os.freemem(),
              load: os.loadavg(),
            },
          })
        );
      } else {
        socket.emit(
          'health',
          JSON.stringify({
            wifi: currentConnections[0],
            ping: true,
            kioskId: KIOSKID,
            time: new Date(),
            os: {
              uptime: os.uptime(),
              freeMem: os.freemem(),
              load: os.loadavg(),
            },
          })
        );
      }
    });
  }, 20000);
});