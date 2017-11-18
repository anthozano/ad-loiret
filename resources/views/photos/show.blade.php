@extends('default')

@section('content')
    <dl>
        <dt>Serie</dd>
        <dd>{{ $photo->serie }}</dd>
        <dt>Article</dd>
        <dd>{{ $photo->article }}</dd>
        <dt>Discriminant</dd>
        <dd>{{ $photo->discriminant }}</dd>
        <dt>Notes</dd>
        <dd>{{ $photo->notes }}</dd>
        <dt>Index_personnes</dd>
        <dd>{{ $photo->index_personnes }}</dd>
        <dt>Fichier_num</dd>
        <dd>{{ $photo->fichier_num }}</dd>
        <dt>Nb_cliche</dd>
        <dd>{{ $photo->nb_cliche }}</dd>
        <dt>Support</dd>
        <dd>{{ $photo->support }}</dd>
        <dt>Chroma</dd>
        <dd>{{ $photo->chroma }}</dd>
        <dt>Remarques</dd>
        <dd>{{ $photo->remarques }}</dd>
        <dt>Date (jj/mm/aaaa)</dd>
        <dd>{{ $photo->date->jour }}/{{ $photo->date->mois }}/{{ $photo->date->annee }}</dd>
        <dt>Geo</dd>
        <dd>{{ $photo->geo->commune }}</dd>
        <dt>Description</dd>
        <dd>{{ $photo->description->label }}</dd>
        <dt>Taille(s)</dt>
        <dd>{{ $photo->tailles }}</dd>
    </dl>
    <div id="map" style="height:420px"></div>
    <script>
        var map;
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: 47.916672, lng: 1.9},
                zoom: 8
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC07ggQxm2RGneiEAoEhrolExEaaJp6dyc&callback=initMap"
            async defer></script>
@endsection
