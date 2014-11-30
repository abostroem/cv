bib = open('refs.bib').readlines()

def show_refs( txt, type ):
    for line in txt:
        if not '@{}'.format( type ) in line: continue
        line = line.strip().split('{')[1][:-1]
        line = '\hangbibentry{' + line + '}'
        print line

for reftype in ['ARTICLE', 'TECHREPORT', 'INPROCEEDINGS']:
    print '%%%',reftype
    show_refs( bib, reftype )  

