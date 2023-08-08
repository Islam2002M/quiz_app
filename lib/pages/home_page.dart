import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
      int questionIndex=0;
      bool showResultMessage=false;
      int ?yourChoiceIndex;
      final snackBar=SnackBar(content: Text('This Question is required ,you can not mve!'),);
      int score=0;

      List <Map<String,dynamic>> questionsWithAnswers=[
        {
          'correct':'1',
          'question':'What is your favourate sport?',
          'answers':[
            'Football',
            'Tenni',
            'Basketball',
            'Vollyball',
            

          ],  
        },
          
          {
          'correct':'2',
          'question':'What is your favourate color?',
          'answers':[
            'Red',
            'Green',
            'Blue',
            'Yellow',

          ],
        },
        {
          'correct':'1',
          'question':'What is your favourate animal?',
          'answers':[
            'lion',
            'cat',
            'Dog',
            'Zebra',

          ],
        },
      ];
      void resetQuiz()
      {
        setState(() {
          questionIndex=0;
          showResultMessage=false;
        });
      }
      Widget _stepIndicator()
      {
        return Column(
          children: [

          ],
        );
      }
      @override
      Widget build(BuildContext context){
        final questionsWithAnswer=questionsWithAnswers[questionIndex];
        final size=MediaQuery.of(context).size;

        return Scaffold(
          body:SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: showResultMessage==false? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(showResultMessage==false) ...[
                    SizedBox(height: size.height * 0.1),
                    Text(questionsWithAnswer['question'],
                    style:TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    )
                    ),
                    SizedBox(height: 16.0,),
                    
                    Text('Answer and get points',
                    style:TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    )
                    ),
                    SizedBox(height:25),

                    Text('Step ${questionIndex+1} of ${questionsWithAnswer['answers'].length-1}',
                    style:TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    )
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LinearProgressIndicator(
                      value:((questionIndex)*(3/10))+0.3,
                      valueColor: AlwaysStoppedAnimation(Colors.green),
                      backgroundColor: Colors.black12,
                    ),
                      SizedBox(height: size.height* 0.1),
                      for(int i=0;i<questionsWithAnswer['answers'].length;i++)
                        
                          Padding(
                            padding: const EdgeInsets.only(bottom:16.0),
                            child: InkWell(
                              onTap:(){
                                setState(() {
                                  yourChoiceIndex=i;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: i!=yourChoiceIndex ? Colors.white:Colors.green,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border:Border.all(
                                    color:Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.abc_outlined,
                                    color:i==yourChoiceIndex? Colors.white:Colors.black,
                                    ),
                                    SizedBox(
                                      width:16.0,
                                    ),
                                    Text(questionsWithAnswer['answers'][i],
                                    style:TextStyle(
                                      fontSize: 16,
                                      color:i==yourChoiceIndex? Colors.white:Colors.black,

                                    )
                                  ),
                                                        
                                ],
                                ),
                              ),
                              ),
                            ),
                          ),
                          
                          Spacer(),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){
                                setState(() {
                          
                                  if(yourChoiceIndex==null)
                                  {
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                  if(yourChoiceIndex!=null)
                                  {
                                    if(questionIndex<questionsWithAnswers.length-1 && yourChoiceIndex!=null){
                                        questionIndex++;
                                  }
                                    else{
                                        showResultMessage=true;
                                        }
                                      yourChoiceIndex =null;
                                  }
                                    else{
                                    
                                      }
                                  });
                          
                              }, 
                              child: Text('Next'),
                              style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape:RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),

                                  ),
                              ),
                              ),
                              ),

                                    
                  ],
                ],
                
              ):Center(
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text("Congrutlation",style:TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ) ,
                        ),
                        SizedBox(height: 8.0,),
                        Text("your score is : ${questionIndex+1}/${questionsWithAnswers.length}",
                        style:TextStyle(
                          fontSize: 20,
                        ),
                        ),
                        TextButton(onPressed: resetQuiz
                        , child: Text('Reset quiz'),
                        style:TextButton.styleFrom(
                          foregroundColor: Colors.green,
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )
                        )
                        ),
              
                  ],
                  
                ),
              ),
            ),
          ),
        );
        
      }
      }