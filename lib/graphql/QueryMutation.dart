class QueryMutation {
  static String getRestsList() {
    return """
      query{
        getRestsList(){
          res_idx
          res_name
          res_address
          created_date
          modified_date
        }
      }
    """;
  }

  static String getRest(String _resId) {
    return """
      query{
        getRest(
          res_idx:"$_resId"
        ){
          res_name
          res_address
          avgs
        }
      }
    """;
  }
}
