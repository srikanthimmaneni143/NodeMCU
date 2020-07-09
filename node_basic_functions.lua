--print(node.flashsize())
--node.restart() ---> Restart module
-----------------------------------------------------
-----------------------------------------------------
print('ESP chip ID: '..node.chipid())
print('\nFlash size: '..node.flashsize()..('(In bytes)'))
print('\nCurrent CPU frequncy: '..node.getcpufreq())
-----------------------------------------------------
-----------------------------------------------------
function print_hardware()
    print('\nHardware Details:')
    for k,v in pairs(node.info('hw')) do
        print(k..':\t'..v)
    end
end
-----------------------------------------------------
-----------------------------------------------------
function print_software()
    print('\nSoftware details:')
    for k,v in pairs(node.info('sw_version')) do
        print(k..':\t'..v)
    end
end
-----------------------------------------------------
-----------------------------------------------------
function print_buildconfig()
    print('\nBuild config details:')
    for k,v in pairs(node.info('build_config')) do
        print(k..':\t'..v)
    end
end
