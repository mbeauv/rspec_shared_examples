module RSpecSharedExamples

  module I18nRSpecHelpers
  
    extend RSpec::Core::SharedContext
    
    # This contains a set of reusable rspec tests that allows validation of a given view
    # with two types of tests.  First, it makes sure that there are no missing translations.
    # Second, it ensures that values are properly displayed.  
    #
    # For more information, check out: http://martinbeauvais.net/
    #
    # Here's an example of how you could use it:
    #
    # RSpec.describe 'test/show', :type => :view do
    #
    #   subject { Capybara::Node::Simple.new(render) }
    #
    #   it_behaves_like "properly internationalized page", [ :en, :fr ],
    #     {
    #       '#issue_summary > div > div.description > div.location > p': [ 'near abbey road', 'près de abbey road' ],
    #       '#comments > div.panel_content > form > div.actions > input[type="submit"]': [ 'Add', 'Ajouter' ]
    #     }
    #
    # end
    shared_examples_for "properly internationalized page" do |*args|
    
      locales = args[0]
      specifics = args[1] || {}
  
      locales.each_with_index do |locale, index|
  
        describe "for locale #{locale}" do
    
          before do
            I18n.locale = locale
          end
    
          it "does not have missing translations" do
            missing_translations = subject.all('span.translation_missing')
            missing_translations.each do |element|
              puts element['title']
            end
            expect(missing_translations.count).to eq(0)
          end
      
          specifics.each_key do |selector|
        
            it "translates #{selector} correctly" do
              expect(subject).to have_selector(selector.to_s)
          
              element = subject.find(selector.to_s)
              element.tag_name == 'input' ?
                (expect(element['value']).to eq(specifics[selector][index])) :
                (expect(element).to have_content(specifics[selector][index]))

            end
        
          end
    
        end
  
      end
  
    end

  end  
  
end

