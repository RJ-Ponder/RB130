def decrypt(name)
  array = name.split("")

  new = array.map do |letter|
    case letter.ord
    when 65..77, 97..109
      (letter.ord + 13).chr
    when 78..90, 110..122
      (letter.ord - 13).chr
    else
      letter.ord.chr
    end
  end

  puts new.join("")
end

decrypt("Nqn Ybirynpr") # => Ada Lovelace (first computer program)
decrypt("Tenpr Ubccre") # => Grace Hopper (COBOL)
decrypt("Nqryr Tbyqfgvar") # => Adele Goldstine (wrote manual for ENIAC, the first programmable, electronic, general-purpose digital computer)
decrypt("Nyna Ghevat") # => Alan Turing (father of theoretical computer science and artificial intellegence)
decrypt("Puneyrf Onoontr") # => Charles Babbage (first computer designs, mechanical)
decrypt("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv") # => Abdullah Muhammad bin Musa al-Khwarizmi (Algorithm, algebra, astronomy, trigonometry)
decrypt("Wbua Ngnanfbss") # => John Atanasoff (first electronic digital computer)
decrypt("Ybvf Unvog") # => Lois Haibt (FORTRAN)
decrypt("Pynhqr Funaaba") # => Claude Shannon (the father of information theory)
decrypt("Fgrir Wbof") # => Steve Jobs (pioneer of the personal computer revolution; maybe more marketing side)
decrypt("Ovyy Tngrf") # => Bill Gates (pioneer of the microcomputer revolution)
decrypt("Gvz Orearef-Yrr") # => Tim Berners-Lee (inventor of the world wide web)
decrypt("Fgrir Jbmavnx") # => Steve Wozniak (pioneer of the personal computer revolution; maybe more engineering side)
decrypt("Xbaenq Mhfr") # => Konrad Zuse (inventor of the modern computer, 1941 - world's first programmable computer)
decrypt("Fve Nagbal Ubner") # => Sir Antony Hoare (foundational contributions to programming languages, algorithms, operating systems, formal verification, and concurrent computing.)
decrypt("Zneiva Zvafxl") # => Marvin Minsky (computer scientist pioneering AI research and co-founder of MIT's AI Lab)
decrypt("Lhxvuveb Zngfhzbgb") # => Yukihiro Matsumoto (chief designer of the Ruby programming language)
decrypt("Unllvz Fybavzfxv") # => Hayyim Slonimski (algebra and astronomy, calculating machine, multiple telegraphy)
decrypt("Tregehqr Oynapu") # => Gertrude Blanch (pioneering work in numerical analysis and computation)
