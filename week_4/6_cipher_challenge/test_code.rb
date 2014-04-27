require_relative "my_solution"

describe "north_korean_cipher" do
  it "alphabet characters are returned as characters shifted four letters forward" do
   north_korean_cipher("maerxegsoi.").should == "iwantacoke."  
   end

  it "numbers are returned as numbers divided by 100" do
  north_korean_cipher("$%#1000.").should == "10."
  end

  it "non alphanumeric characters are not returned, excepting final character" do
    north_korean_cipher("$%#").should == "#"
  end

 it "spaces occur between words, and final character stays as final" do
    north_korean_cipher("m^aerx%e&gsoi!").should == "i want a coke!"
  end

 it "Sentence 2 Cipher Test" do
 north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.").should == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
end

    it "Sentence 3 Cipher Test" do
  north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!").should == "our nukes are held together by grape flavored toffee don t tell the us!"
end
    
    it "Sentence 4 Cipher Test" do
  north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!").should == "our nukes are held together by grape flavored toffee don t tell the us!"
end
    it "Sentence 5 Cipher Test" do
    north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.").should == "if you make one mistake gen ri yong gil you will be replaced by dennis rodman."
    end
    
    it "Sentence 6 Cipher Test" do
    north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!").should == "next stop south korea then japan then the world!"
    end
    
    it "Sentence 7 Cipher Test" do
    north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?").should == "can somebody just get me 100 bags of cool ranch doritos?"
    end
end