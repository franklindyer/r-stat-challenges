import jinja2
import json
import os
import markdown
import markdown2

JLOAD = jinja2.FileSystemLoader(searchpath="./src")
JENV = jinja2.Environment(loader=JLOAD)
LISTING = json.loads(open("./listing.json").read())
MD_EXT = ['mdx_math', 'markdown.extensions.tables', 'md_in_html', 'tables']
MD_PROC = markdown.Markdown(extensions=MD_EXT)

for chal in LISTING['challenges']:
    id = chal['id']
    md_content = open(f"./desc/{id}.md", 'r').read()
    html_content = MD_PROC.convert(md_content)
    html_content = markdown2.markdown(html_content)
    skeleton = open(f"./skeletons/{id}.r", 'r').read()
    html_tpl = JENV.get_template("challenge.tpl")
    html_page = html_tpl.render(content=html_content, chal=chal, skeleton=skeleton, conf=LISTING["config"])
    
    f = open(f"./dist/challenges/{id}.html", 'w')
    f.write(html_page)
    f.close()

html_tpl = JENV.get_template("index.tpl")
html_page = html_tpl.render(chals=LISTING['challenges'], conf=LISTING["config"])

f = open(f"./dist/index.html", 'w')
f.write(html_page)
f.close()
