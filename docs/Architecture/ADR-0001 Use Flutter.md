# Use Flutter

## Status

Accepted

## Context

Flutter is a framework for building apps provided by google.  Google desribe it as a
> ... UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.

It places an emphasis on fast development, expressive and flexible ui, and native performance.

Gregg Miller, who is a Senior Anesthesiologist at Western Health hospitals reached out to us with a mobile app he had been developing to provide COVID-19 information to frontline medical staff.  The app had been developed in flutter.  Gregg wanted to know what help we could provide in getting it across the finish line.  Time was extremely short - we needed to put together and ship an app to the hospital before the crisis swamped the staff, which at that time as predicted to occur in about 2 weeks.

Luke immediately put out the call and assembled a team of Flutter developers from the GDG community.  We performed an initial evaluation on the codebase and decided that it would be best to perform a re-write rather than building on the existing codebase.

At this stage it would have been possible to drop flutter and build out native applications, or built the app using some other cross platform toolkit such as react native.

## Decision

Time was of the essence - as we already had a team of flutter developers ready to go we decided to continue on with using flutter to build the app.  It was also likely that flutters emphasis on fast development and an expressive UI would be helpful in quickly building out the app.

## Consequences

The app is built in Flutter.  This means that it will be easy to build both iOS and Android versions of the app from a single codebase.  However addressing platform specific issues may be more complicated.  This also means that any devs wishing to contribute to the project will have to be familiar with Flutter.