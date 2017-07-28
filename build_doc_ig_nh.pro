outdir='./newheader/guides/'
idldoc,root=getenv('OMINAS_DIR')+'/guides',output=outdir,title='OMINAS Documentation',$
 /embed,/statistics,format_style='ominas',overview='./overview.idldoc',comment_style='html',template_location='./templates_nobar/',/nosource,/user
replaceoverview,outdir+'overview.html',outdir+'/install_guide.html',outdir+'overview.old'
file_copy,['./headerbar.html','./empty.html'],outdir,/verbose,/overwrite
