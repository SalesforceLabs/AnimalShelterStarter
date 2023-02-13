public class What3Words {
  
    public String country {get;set;} 
    public Square square {get;set;} 
    public String nearestPlace {get;set;} 
    public Southwest coordinates {get;set;} 
    public String words {get;set;} 
    public String language {get;set;} 
    public String mapUrl {get;set;} // in json: map
  
    public What3Words(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'country') {
              country = parser.getText();
            } else if (text == 'square') {
              square = new Square(parser);
            } else if (text == 'nearestPlace') {
              nearestPlace = parser.getText();
            } else if (text == 'coordinates') {
              coordinates = new Southwest(parser);
            } else if (text == 'words') {
              words = parser.getText();
            } else if (text == 'language') {
              language = parser.getText();
            } else if (text == 'map') {
              mapUrl = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'What3Words consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
    
    public class Square {
      public Southwest southwest {get;set;} 
      public Southwest northeast {get;set;} 
  
      public Square(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
          if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
            String text = parser.getText();
            if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
              if (text == 'southwest') {
                southwest = new Southwest(parser);
              } else if (text == 'northeast') {
                northeast = new Southwest(parser);
              } else {
                System.debug(LoggingLevel.WARN, 'Square consuming unrecognized property: '+text);
                consumeObject(parser);
              }
            }
          }
        }
      }
    }
  
    public class Southwest {
      public Double lng {get;set;} 
      public Double lat {get;set;} 
  
      public Southwest(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
          if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
            String text = parser.getText();
            if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
              if (text == 'lng') {
                lng = parser.getDoubleValue();
              } else if (text == 'lat') {
                lat = parser.getDoubleValue();
              } else {
                System.debug(LoggingLevel.WARN, 'Southwest consuming unrecognized property: '+text);
                consumeObject(parser);
              }
            }
          }
        }
      }
    }  
      
    public static void consumeObject(System.JSONParser parser) {
      Integer depth = 0;
      do {
        System.JSONToken curr = parser.getCurrentToken();
        if (curr == System.JSONToken.START_OBJECT || 
          curr == System.JSONToken.START_ARRAY) {
          depth++;
        } else if (curr == System.JSONToken.END_OBJECT ||
          curr == System.JSONToken.END_ARRAY) {
          depth--;
        }
      } while (depth > 0 && parser.nextToken() != null);
    }
    
    public static What3Words parse(String json) {
      System.JSONParser parser = System.JSON.createParser(json);
      return new What3Words(parser);
    }
  
  }