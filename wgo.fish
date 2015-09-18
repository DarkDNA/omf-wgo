function init -a path --on-event init_wgo
  if not available wgo
    echo "You must have wgo installed to use this plugin."
    return
  end
  
  for arch in 386 amd64 arm;
    for os in windows linux darwin android nacl;
      function wgo-$os-$arch
        env GOOS=$os GOARCH=$arch wgo $argv
      end
    end
  end

  function wgo-js -d "Runs gopherjs using wgo-exec"
    wgo-exec gopherjs $argv
  end

  function wgo-debug -d "Runs godebug using wgo-exec"
    wgo-exec godebug $argv
  end
end

