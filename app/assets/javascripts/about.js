var foundersText =
    "<b>Xinran (Leo) Liu</b><br/>Graduated from Cornell University with a major in Chemistry and Chemical Biology.  " +
        " He is currently a 4th year medical student at the Geisel School of Medicine trying to decide which specialty to go into.  " +
        "His interests outside of clinical practice include LEAN process improvement, entrepreneurship, and medical education.  " +
        "In his free time, he enjoys reading, ultimate frisbee, basketball, tennis, ping pong, golf, drawing, among numerous other random things." +
        "<br/>" +
        " <b>Whitney de Luna</b><br/>" +
        " Graduated from Stanford University with a major in biological sciences. She is currently a 4th year medical student interested " +
        "in anesthesiology. Outside of the clinic her academic interests include the use of technology for education and global health. " +
        "In her free time she enjoys traveling, cooking, playing tennis and golf." +
        "<br/>" +
        "<b>Sharath Bhagavatula</b><br/>" +
        "Graduated from Cornell University with a major in Electrical and Computer Engineering. He is currently a 4th year medical student " +
        "at NYU School of Medicine interested in radiology. Outside of the clinic, his academic interests include using technology to " +
        "advance medicine through research and education. Other interests include tennis, basketball, and Matlab.";

var collaborationText = "The site is a collaboration between UndergroundMed and MedU....." ;

function aboutFounders() {
  showinfoDialog(foundersText, "Founders");
}

function aboutCollaboration() {
  showinfoDialog(collaborationText, "Collaboration");
}