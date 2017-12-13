outdir='./testtxt/nv/'
idldoc,root=getenv('OMINAS_DIR')+'/nv',output=outdir,title='OMINAS Documentation',$
 format_style='ominas',overview='./overview.idldoc',/nosource,/default_private,comment_style='plain',template_prefix='plain-',template_location='./templates_newheader/'
;replaceoverview,outdir+'overview.html',getenv('OMINAS_DIR')+'/docs_src/overview_api.html',outdir+'overview.old'
;file_copy,'./headerbar.html',outdir,/verbose,/overwrite
