const { exec } = require('child_process');


(() => {
    let index = 0
    setInterval(() => {
        exec('curl -i http://13.209.105.175:80', (error, stdout, stderr) => {
            if (error) {
                console.error(`exec error: ${error}`);
                return;
            }
            console.log(`hello :${index++}`);
        });
    }, 2000);
})();
