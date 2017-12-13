outdir='./newheader/nv/'
idldoc,root=getenv('OMINAS_DIR')+'/nv',output=outdir,title='OMINAS Documentation',$
 /embed,/statistics,format_style='ominas',overview='./overview.idldoc',template_location='./templates_newheader/',/nosource,/user,/default_private
replaceoverview,outdir+'overview.html',getenv('OMINAS_DIR')+'/docs_src/overview_api.html',outdir+'overview.old'
file_copy,'./headerbar.html',outdir,/verbose,/overwrite
