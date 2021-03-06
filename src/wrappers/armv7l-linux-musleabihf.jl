# Autogenerated wrapper script for XML2_jll for armv7l-linux-musleabihf
export libxml2, xmlcatalog, xmllint

using Zlib_jll
using Libiconv_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libxml2`
const libxml2_splitpath = ["lib", "libxml2.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libxml2_path = ""

# libxml2-specific global declaration
# This will be filled out by __init__()
libxml2_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libxml2 = "libxml2.so.2"


# Relative path to `xmlcatalog`
const xmlcatalog_splitpath = ["bin", "xmlcatalog"]

# This will be filled out by __init__() for all products, as it must be done at runtime
xmlcatalog_path = ""

# xmlcatalog-specific global declaration
function xmlcatalog(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(xmlcatalog_path)
    end
end


# Relative path to `xmllint`
const xmllint_splitpath = ["bin", "xmllint"]

# This will be filled out by __init__() for all products, as it must be done at runtime
xmllint_path = ""

# xmllint-specific global declaration
function xmllint(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(xmllint_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"XML2")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list, Libiconv_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list, Libiconv_jll.LIBPATH_list,))

    global libxml2_path = normpath(joinpath(artifact_dir, libxml2_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libxml2_handle = dlopen(libxml2_path)
    push!(LIBPATH_list, dirname(libxml2_path))

    global xmlcatalog_path = normpath(joinpath(artifact_dir, xmlcatalog_splitpath...))

    push!(PATH_list, dirname(xmlcatalog_path))
    global xmllint_path = normpath(joinpath(artifact_dir, xmllint_splitpath...))

    push!(PATH_list, dirname(xmllint_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

