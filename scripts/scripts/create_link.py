# This script read an rectangle annotation and create a link of a given page
from PyPDF2 import PdfReader
import os
import subprocess
import sys
import tempfile

originalPDF = sys.argv[1]
annotatedPDF = "annotated.pdf"
reader = PdfReader(originalPDF)

def get_location():
    an_page=1;
    for page in reader.pages:
        if "/Annots" in page:
            for annot in page["/Annots"]:
                obj = annot.get_object()
                if obj["/Subtype"] == "/Square":
                    annotation = {"subtype": obj["/Subtype"], "location": obj["/Rect"]}
                    return [str(obj['/Rect']).replace(',',''), an_page]
        an_page=an_page+1
    return [False,0]

def create_hyperlink(original, link_page):
    if not os.path.exists(original):
        print(original+" does not exist")
        return False
    annotated = "annotated.pdf"
    location, rec_page = get_location()
    if not location:
        print("Square not found")
        return False

    pdfMarkCommand = """[
    /Rect {location}
    /Page {link_page} 
    /Color [1 0 0]
    /View [/XYZ -5 797 1.5]
    /SrcPg {rec_page}
    /Subtype /Link
    /ANN pdfmark
    """.format(location=location, rec_page=rec_page, link_page=link_page)
    print("Creating link from "+str(rec_page)+" to "+str(link_page))

    fh, fpath = tempfile.mkstemp()
    with open(fpath, 'w') as f:
      f.write(pdfMarkCommand)

    subprocess.run(['gs', '-dBATCH', '-dNOPAUSE', '-dQUIET', '-sDEVICE=pdfwrite', f'-sOutputFile={annotated}', fpath, original])
    os.remove(fpath)
    print("New link created")
    subprocess.run(['okular','-p', str(rec_page), annotated])
    return True

create_hyperlink(originalPDF, sys.argv[2])
