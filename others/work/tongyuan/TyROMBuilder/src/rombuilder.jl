function conbufer(input, output, path, name)
    input = string(input)
    output = string(output)
    PATH1 = dirname(Base.active_project())
    PATH2 = "/src/Windows/CPU/Minfer/conbufer.bat"
    PATH = PATH1 * PATH2
    if Sys.iswindows()
        run(`$PATH $input $output $path $name`)
    end
end