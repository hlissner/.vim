if filereadable("./Makefile")
    setl makeprg=make\ &&\ app
else
    setl makeprg=make\ %:r\ &&\ %:r
endif
