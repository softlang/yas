#
# (C) Ralf Laemmel, 2015, elision preprocessor
#

import os
import string

exts = dict()
exts["hs"] = ("-- BEGIN ...", "-- END ...", "-- ...")
exts["java"] = ("// BEGIN ...", "// END ...", "// ...")
exts["bnl"] = None
exts["btl"] = None
exts["tokens"] = None
exts["value"] = None
exts["formula"] = None
exts["fsml"] = None
exts["g4"] = exts["java"]
exts["Makefile"] = None
exts["json"] = None
exts["tbl"] = None
exts["xml"] = None
exts["xsd"] = None
exts["py"] = ("# BEGIN ...", "# END ...", "# ...")
exts["input"] = None
exts["output"] = None
exts["el"] = None
exts["elrl"] = None
exts["py-template"] = exts["py"]
exts["dot"] = None
exts["pro"] = ("% BEGIN ...", "% END ...", "% ...")
exts["ueber"] = ("% BEGIN ...", "% END ...", "% ...")
exts["term"] = exts["pro"]
exts["lalconfig"] = exts["pro"]
exts["graph"] = exts["pro"]
exts["tree"] = exts["pro"]
exts["bgl"] = exts["pro"]
exts["egl"] = exts["java"]
exts["bsl"] = exts["pro"]
exts["esl"] = exts["java"]
exts["lal"] = exts["java"]
exts["lal2"] = exts["java"]
exts["bfpl"] = exts["hs"]
exts["efpl"] = exts["hs"]
exts["ull"] = exts["hs"]
exts["tll"] = exts["hs"]
exts["pll"] = exts["hs"]
exts["bipl"] = exts["java"]
exts["mml"] = exts["java"]
exts["eipl"] = exts["java"]
for root in ["languages", "lib", "samples"]:
    for (dirpath, dirnames, filenames) in os.walk(root):
        print dirpath
        for filename in filenames:
            ext = filename.rpartition('.')[-1]
            if ext in exts:
                print " " + filename
                with open(dirpath + "/" + filename, "r") as infile:
                    with open(dirpath + "/" + filename + "...", "w") as outfile:
                        if exts[ext] is None:
                            for line in infile:
                                outfile.write(line)
                        else:
                            (begin, end, ddd) = exts[ext]
                            skip = False
                            for line in infile:
                                if line.startswith(begin):
                                    skip = True
                                elif line.startswith(end):
                                    skip = False
                                elif ddd in line:
                                    line = string.replace(line, ddd, "...")
                                    outfile.write(line)
                                elif not skip:
                                    outfile.write(line)
