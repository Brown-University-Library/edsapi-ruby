require_relative 'test_helper'

class EdsApiTests < Minitest::Test

  def test_journal_citations
    session = EBSCO::EDS::Session.new({:guest => false})
    if session.dbid_in_profile 'asn'
      record = session.retrieve({dbid: 'asn', an: '108974507'})
      apa_cite = record.citation('apa').first
      mla_cite = record.citation('modern-language-association').first
      chicago_cite = record.citation('chicago-author-date').first
      assert apa_cite == 'Weissman, K. J. (2015). The structural biology of biosynthetic megaenzymes. Nature Chemical Biology, (9), 660–670.'
      assert chicago_cite == 'Weissman, Kira J. 2015. “The Structural Biology of Biosynthetic Megaenzymes.” Nature Chemical Biology, no. 9 (September): 660–70.'
      assert mla_cite == 'Weissman, Kira J. “The Structural Biology of Biosynthetic Megaenzymes.” Nature Chemical Biology 9 (2015): 660–670. Print.'
    end
    session.end
  end

  def test_book_citations
    session = EBSCO::EDS::Session.new({:guest => false})
    if session.dbid_in_profile 'asn'
      record = session.retrieve({dbid: 'cat02060a', an: 'd.uga.3690122'})
      apa_cite = record.citation('apa').first
      mla_cite = record.citation('modern-language-association').first
      chicago_cite = record.citation('chicago-author-date').first
      # puts 'APA: ' + apa_cite.inspect
      # puts 'CHICAGO: ' + chicago_cite.inspect
      # puts 'MLA: ' + mla_cite.inspect
      assert apa_cite == 'Rowling, J. K., & GrandPré, M. (1999). Harry Potter and the sorcerer\'s stone. New York : Scholastic, [1999].'
      assert chicago_cite == 'Rowling, J. K., and Mary GrandPré. 1999. Harry Potter and the Sorcerer\'s Stone. New York : Scholastic, [1999].'
      assert mla_cite == 'Rowling, J. K., and Mary GrandPré. Harry Potter and the Sorcerer\'s Stone. New York : Scholastic, [1999], 1999. Print.'
    end
    session.end

  end


  def test_conference_citations
    session = EBSCO::EDS::Session.new({:guest => false})
    if session.dbid_in_profile 'asn'
      record = session.retrieve({dbid: 'asn', an: '118411536'})
      apa_cite = record.citation('apa').first
      mla_cite = record.citation('modern-language-association').first
      chicago_cite = record.citation('chicago-author-date').first
      # puts 'APA: ' + apa_cite.inspect
      # puts 'CHICAGO: ' + chicago_cite.inspect
      # puts 'MLA: ' + mla_cite.inspect
      assert apa_cite == 'Chitea, F. (2016). ELECTRICAL SIGNATURES OF MUD VOLCANOES CASE STUDIES FROM ROMANIA. In Proceedings of the International Multidisciplinary Scientific GeoConference SGEM (pp. 467–474).'
      assert chicago_cite == 'Chitea, Florina. 2016. “ELECTRICAL SIGNATURES OF MUD VOLCANOES CASE STUDIES FROM ROMANIA.” In Proceedings of the International Multidisciplinary Scientific GeoConference SGEM, 467–74.'
      assert mla_cite == 'Chitea, Florina. “ELECTRICAL SIGNATURES OF MUD VOLCANOES CASE STUDIES FROM ROMANIA.” Proceedings of the International Multidisciplinary Scientific GeoConference SGEM. 2016. 467–474. Print.'
    end
    session.end
  end

end
