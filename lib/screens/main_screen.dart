import 'package:curso_job_finder_app/components/job_list.dart';
import 'package:curso_job_finder_app/models/company.dart';
import 'package:curso_job_finder_app/models/job.dart';
import 'package:flutter/material.dart';

import 'package:curso_job_finder_app/components/job_carousel.dart';


class MainScreen extends StatelessWidget {
  //const MainScreen({Key key}) : super(key: key);

  List<Job> forYouJobs = [
    Job(
      role: 'Product Designer',
      location: 'San Francisco, CA',
      isFavorites: true,
      company: Company(
        name: 'Google',
        urlLogo: 'https://s1.eestatic.com/2017/02/24/actualidad/Actualidad_196242404_129790153_1024x576.jpg'
      )
    ),
    Job(
      role: 'Frontend Web',
      location: 'Miami',
      isFavorites: false,
      company: Company(
        name: 'Netflix',
        urlLogo: 'https://www.clipartkey.com/mpngs/m/103-1039049_netflix-icon-transparent-background-netflix-logo-png.png'
      )
    ),
    Job(
      role: 'Mobile Developer',
      location: 'New York',
      isFavorites: false,
      company: Company(
        name: 'Amazon',
        urlLogo: 'https://www.enjoyzaragoza.es/wp-content/uploads/2020/02/amazon.jpg'
      )
    )
  ];

  List<Job> recentJobs = [
    
    Job(
      role: 'UX Enginner',
      location: 'Mountain View, CA',
      company: Company(
        name: 'Apple',
        urlLogo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1200px-Apple_logo_black.svg.png'
      ),
      isFavorites: true,
    ),
    Job(
      role: 'Motion Designer',
      location: 'New York, NY',
      company: Company(
        name: 'AirBnb',
        urlLogo: 'https://www.casamendia.es/wp-content/uploads/2015/07/14961528-0-airbnb-logo.png'
      ),
      isFavorites: true,
    ),
    Job(
      role: 'Python Developer',
      location: 'New York',
      company: Company(
        name: 'Amazon',
        urlLogo: 'https://pngimg.com/uploads/amazon/amazon_PNG22.png'
      ),
      isFavorites: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _custonAppBar(),
            _textsHeader(context),
            _forYou(context),
            _recent(context),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }

  Widget _custonAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),      
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.list_alt, size: 35.0,),
            onPressed: (){}
          ),
          Row(
            children: [              
              IconButton(
                icon: Icon(Icons.search, size: 35.0,),
                onPressed: (){}
              ),
              IconButton(
                icon: Icon(Icons.tune_rounded, size: 35.0,),
                onPressed: (){}
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textsHeader(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi jade', style: Theme.of(context).textTheme.bodyText1),
          Text('Find your next', style: Theme.of(context).textTheme.headline1),
          Text('design job', style: Theme.of(context).textTheme.headline2)
        ],
      ),
    );
  }

  Widget _forYou(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text('For YOU', style: Theme.of(context).textTheme.bodyText1),
        ),
        JobCarousel(this.forYouJobs),
      ],
    );
  }

  _recent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Recent',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'See All',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: JobList(this.recentJobs),
        ),
      ],
    );
  }
}