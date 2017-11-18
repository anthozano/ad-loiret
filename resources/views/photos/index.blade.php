@extends('default')

@section('content')
    <div>
        <a href="{{ route('photos.create') }}" class="btn btn-primary">Créer une nouvelle photo</a>
    </div>
    <table class="table">
        <tr>
            <th>Réf(s) cindoc</th>
            <th>Série</th>
            <th>Article</th>
            <th>Ville</th>
            <th>Taille</th>
            <th colspan="3">Actions</th>
        </tr>
    @foreach($photos as $photo)
            <tr>
                <td>
                    @foreach($photo->cindocs as $cindoc)
                       {{ $cindoc->label }}
                    @endforeach
                </td>
                <td>{{ $photo->serie }}</td>
                <td>{{ $photo->article}}</td>
                <td>{{ $photo->geo->commune }}</td>
                <td>{{ $photo->taille}}</td>
                <td><a class="btn btn-default" href="{{ route('photos.show', $photo)}}">Voir</a></td>
                <td><a class="btn btn-primary" href="{{ route('photos.edit', $photo)}}">Editer</a></td>
                <td><a class="btn btn-danger" href="{{ route('photos.destroy', $photo)}}">Supprimer</a></td>
            </tr>
        @endforeach
    </table>
@endsection
