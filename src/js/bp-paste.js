(function() {
    
    BrowserPlus.init(function(res) {  
        if (res.success) {
            BrowserPlus.require({
                services: [
                    {
                        service: "PBPaste",
                        version: "0",
                        minversion: "0.0.1"
                    },
                    {
                        service: 'FileAccess',
                        version: "1"
                    }
                    
                ]
            }, function(r) {
                if (r.success) {
                    YAHOO.util.Event.on('getBuffer', 'click', function() {
                        BrowserPlus.PBPaste.get({ callback: function() {
                        }}, function(x) {
                            var path = x.value;
                            if (path === false) {
                                alert('No image in buffer, please take a screen shot..');
                            } else {
                                BrowserPlus.FileAccess.GetURL( {file: path}, function(r) {
                                    if (r.success) {  
                                        document.getElementById("result").innerHTML = '<img src=\"' + r.value + '\" height="300" width="300">';
                                    }
                                        
                                });
                            }
                        });
                    });
                } else {
                    alert('BP-PBPaste failed to load..');
                }
            });
        } else {
            alert('Browser Plus failed to load...');
        }
    });

    
})();
