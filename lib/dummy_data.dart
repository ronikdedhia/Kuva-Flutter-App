import 'package:flutter/material.dart';

import './models/categories.dart';
import './models/affirmations.dart';

var DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Health',
    color: Color.fromRGBO(71, 125, 149, 1).withOpacity(0.25),
    iconname: Icon(Icons.healing),
  ),
  Category(
    id: 'c2',
    title: 'Wealth',
    color: Color.fromRGBO(229, 30, 49, 1).withOpacity(0.25),
    iconname: Icon(Icons.money_off),
  ),
  Category(
    id: 'c3',
    title: 'Sports',
    color: Color.fromRGBO(12, 115, 236, 1).withOpacity(0.25),
    iconname: Icon(Icons.play_arrow),
  ),
  Category(
    id: 'c4',
    title: 'Family',
    color: Color.fromRGBO(95, 129, 8, 1).withOpacity(0.25),
    iconname: Icon(Icons.people),
  ),
  Category(
    id: 'c5',
    title: 'Love',
    color: Color.fromRGBO(219, 20, 139, 1).withOpacity(0.25),
    iconname: Icon(Icons.favorite),
  ),
  Category(
    id: 'c6',
    title: 'Relation',
    color: Color.fromRGBO(185, 93, 6, 1).withOpacity(0.25),
    iconname: Icon(Icons.people),
  ),
  Category(
    id: 'c7',
    title: 'Studies',
    color: Color.fromRGBO(30, 50, 100, 1).withOpacity(0.25),
    iconname: Icon(Icons.book),
  ),
  Category(
    id: 'c8',
    title: 'Exams',
    color: Color.fromRGBO(39, 133, 106, 1).withOpacity(0.25),
    iconname: Icon(Icons.book),
  ),
  Category(
    id: 'c9',
    title: 'Business',
    color: Color.fromRGBO(165, 103, 82, 1).withOpacity(0.25),
    iconname: Icon(Icons.money_off),
  ),
  Category(
    id: 'c10',
    title: 'Motivate',
    color: Color.fromRGBO(71, 125, 149, 1).withOpacity(0.25),
    iconname: Icon(Icons.book),
  ),
];

var DUMMY_Affirmations = [
  Affirmations(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'Health',
    imageUrl:
        'https://images.hu-production.be/static/img/home/homepageicons-03.png',
    affirmations: [
      'I restore and maintain my body at optimum health.',
      'I am pain-free and totally in sync with life',
      'I am open and receptive to all the healing energies in the Universe',
      'I know that every cell in my body is intelligent and knows how to heal itself',
      'I take care of my body and spirit through exercise and healthy food choices',
      'I am doing everything I can to help my body be well as quickly as possible.'
    ],
    audioName: [
      'assets/Health1.mp3',
      'assets/Health2.mp3',
      'assets/audio3.mp3',
      'assets/audio4.mp3',
      'assets/audio5.mp3',
      'assets/audio6.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Wealth',
    imageUrl:
        'https://st3.depositphotos.com/12985656/18990/i/600/depositphotos_189907664-stock-photo-close-view-pile-coins-isolated.jpg',
    affirmations: [
      'I am a magnet of success',
      'I am wealthy and prosperous',
      'I am smart',
      'I have the skills',
      'I keep the money I make',
      'I deserve everthing I want'
    ],
    audioName: [
      'assets/audio3.mp3',
      'assets/audio4.mp3',
      'assets/audio3.mp3',
      'assets/audio4.mp3',
      'assets/audio5.mp3',
      'assets/audio6.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm3',
    categories: [
      'c3',
    ],
    title: 'Sports',
    imageUrl: 'https://image.shutterstock.com/z/stock-vector-doodle-vertical-seamless-soccer-composition-with-sport-objects-and-decoration-elements-vector-421953340.jpg',
    affirmations: [
      'I am confident in my ability.',
      'I have the skills needed to perform well.',
      'I can stay focused under pressure',
      'I can perform well in tough competitions.',
      'I feel mentally strong, I can stay positive throughout competition',
      'I like the challenge of competition.'
    ],
    audioName: [
      'assets/Sports1.mp3',
      'assets/Sports2.mp3',
      'assets/audio3.mp3',
      'assets/audio4.mp3',
      'assets/audio5.mp3',
      'assets/audio6.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Family',
    imageUrl:
        'https://i.pinimg.com/originals/1c/af/b4/1cafb40f8a056b0c0bb3ca61e38a98df.jpg',
    affirmations: [
      'I speak life into each and every member of my family.',
      'We are whole, healthy, and walking in the fullness of our purposes.',
      'We have healthy, strong, loving, relationships',
      'We look out for one another.',
      'Our family is blessed and highly favored.',
      'We build each other up, not tear each other down.'
    ],
    audioName: [
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm5',
    categories: [
      'c5',
    ],
    title: 'Love',
    imageUrl:
        'https://images.firstpost.com/wp-content/uploads/2020/01/love-3061483_1280.jpg',
    affirmations: [
      ' I am open to receive knock-my-socks off love.', 
      'I give my heart, ready to receive the heart of another.',
       'I am loved more than I ever thought possible',
        'I love who I am, and so does my partner.', 
        'I am overwhelmed with love!',
         'I love myself.'
         ],
    audioName: [
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm6',
    categories: [
      'c6',
    ],
    title: 'Relationship',
    imageUrl:
        'https://pyxis.nymag.com/v1/imgs/750/5a5/fd3e1a46d6bc8cca856682335b413059f5-23-relationship-anarchy.rsquare.w1200.jpg',
    affirmations: [
      'The universe is bringing my soulmate to me!',
      'My partner shows me deep, passionate love.',
      'I am in a wonderful relationship with someone who treats me right!',
      'I am in the healthiest relationship of my life!',
      'My relationships are always fulfilling.',
      'The Universe wants the most fulfilling, wonderful love for me.'
    ],
    audioName: [
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Studies',
    imageUrl:
        'https://static.toiimg.com/thumb/msid-69524865,width-1070,height-580,imgsize-1114562,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
    affirmations: [
      'I enjoy the subjects I am studying',
      'I easily understand and retain what I study',
      'I am always focused on my studies',
      'I study hard and regularly',
      'My memory is sharp',
      'Getting good grades is natural for me'
    ],
    audioName: [
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'exams',
    imageUrl:
        'https://www.stoodnt.com/blog/wp-content/uploads/2020/01/exam-1575366183.jpg',
    affirmations: [
      'I prepare for exams systematically and intelligently',
      'I am always relaxed during exams',
      'During the exams, I recall information quickly and easily',
      'I stay focused while studying for exams',
      'I begin studying well before exams are scheduled',
      'While writing answers, I recall information quickly',
    ],
    audioName: [
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Business',
    imageUrl:
        'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Falejandrocremades%2Ffiles%2F2018%2F07%2Fdesk-3139127_1920-1200x773.jpg',
    affirmations: [
      'I am a top performer.',
      'I always do better than I did yesterday.',
      'All my thoughts and efforts lead me to the success I desire.',
      'There is an opportunity in everything that presents itself to me.',
      'Obstacles and challenges strengthen me.',
      'I choose to be happy.'
    ],
    audioName: [
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3'
    ],
    akValue: false,
  ),
  Affirmations(
    id: 'm10',
    categories: [
      'c10',
    ],
    title: 'Motivation',
    imageUrl:
        'https://1.bp.blogspot.com/-n0cHyU75eeY/WaPqvSdfSUI/AAAAAAAAbxw/4yF0RGMFceo70b3J9_72ehhYuQp-n4MyACLcBGAs/s1600/Self%2Bmotivation%2Bis%2Bkey.jpg',
    affirmations: [
      'Today will be a productive day.',
      'I am independent and self-sufficien',
      'I can be whatever I want to be.',
      'I am not defined my by past; I am driven by my future.',
      'I use obstacles to motivate me to learn and grow.',
      'I am grateful for everything I have in my life.'
    ],
    audioName: [
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3',
      'assets/audio.mp3'
    ],
    akValue: false,
  ),
];
