PGDMP                         x           Echange_de_connaissances    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16416    Echange_de_connaissances    DATABASE     w   CREATE DATABASE "Echange_de_connaissances" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_Morocco.1252';
 *   DROP DATABASE "Echange_de_connaissances";
                postgres    false            �            1259    16427    question    TABLE     L   CREATE TABLE public.question (
    id bigint NOT NULL,
    question text
);
    DROP TABLE public.question;
       public         heap    postgres    false            �            1259    16425    question_id_seq    SEQUENCE     x   CREATE SEQUENCE public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.question_id_seq;
       public          postgres    false    201            �           0    0    question_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;
          public          postgres    false    200            �            1259    16459    questionneur    TABLE     I   CREATE TABLE public.questionneur (
    iduser integer,
    id integer
);
     DROP TABLE public.questionneur;
       public         heap    postgres    false            �            1259    16480 	   repondeur    TABLE     N   CREATE TABLE public.repondeur (
    iduser integer,
    idresponse integer
);
    DROP TABLE public.repondeur;
       public         heap    postgres    false            �            1259    16472    reponse    TABLE     S   CREATE TABLE public.reponse (
    idresponse integer NOT NULL,
    reponse text
);
    DROP TABLE public.reponse;
       public         heap    postgres    false            �            1259    16493    tags    TABLE     v   CREATE TABLE public.tags (
    tagid integer NOT NULL,
    tagname character varying(255),
    tagdescription text
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    16451    users    TABLE     �   CREATE TABLE public.users (
    iduser integer NOT NULL,
    nom character varying(100),
    prenom character varying(100),
    email character varying(255),
    password character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            :           2604    16430    question id    DEFAULT     j   ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);
 :   ALTER TABLE public.question ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �          0    16427    question 
   TABLE DATA           0   COPY public.question (id, question) FROM stdin;
    public          postgres    false    201   4       �          0    16459    questionneur 
   TABLE DATA           2   COPY public.questionneur (iduser, id) FROM stdin;
    public          postgres    false    203   Q       �          0    16480 	   repondeur 
   TABLE DATA           7   COPY public.repondeur (iduser, idresponse) FROM stdin;
    public          postgres    false    205   n       �          0    16472    reponse 
   TABLE DATA           6   COPY public.reponse (idresponse, reponse) FROM stdin;
    public          postgres    false    204   �       �          0    16493    tags 
   TABLE DATA           >   COPY public.tags (tagid, tagname, tagdescription) FROM stdin;
    public          postgres    false    206   �       �          0    16451    users 
   TABLE DATA           E   COPY public.users (iduser, nom, prenom, email, password) FROM stdin;
    public          postgres    false    202   �       �           0    0    question_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.question_id_seq', 1, false);
          public          postgres    false    200            <           2606    16435    question question_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public            postgres    false    201            @           2606    16479    reponse reponse_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reponse
    ADD CONSTRAINT reponse_pkey PRIMARY KEY (idresponse);
 >   ALTER TABLE ONLY public.reponse DROP CONSTRAINT reponse_pkey;
       public            postgres    false    204            B           2606    16500    tags tags_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tagid);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    206            >           2606    16458    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (iduser);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202            D           2606    16467 !   questionneur questionneur_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.questionneur
    ADD CONSTRAINT questionneur_id_fkey FOREIGN KEY (id) REFERENCES public.question(id);
 K   ALTER TABLE ONLY public.questionneur DROP CONSTRAINT questionneur_id_fkey;
       public          postgres    false    201    2876    203            C           2606    16462 %   questionneur questionneur_iduser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.questionneur
    ADD CONSTRAINT questionneur_iduser_fkey FOREIGN KEY (iduser) REFERENCES public.users(iduser);
 O   ALTER TABLE ONLY public.questionneur DROP CONSTRAINT questionneur_iduser_fkey;
       public          postgres    false    202    2878    203            F           2606    16488 #   repondeur repondeur_idresponse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.repondeur
    ADD CONSTRAINT repondeur_idresponse_fkey FOREIGN KEY (idresponse) REFERENCES public.reponse(idresponse);
 M   ALTER TABLE ONLY public.repondeur DROP CONSTRAINT repondeur_idresponse_fkey;
       public          postgres    false    2880    205    204            E           2606    16483    repondeur repondeur_iduser_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.repondeur
    ADD CONSTRAINT repondeur_iduser_fkey FOREIGN KEY (iduser) REFERENCES public.users(iduser);
 I   ALTER TABLE ONLY public.repondeur DROP CONSTRAINT repondeur_iduser_fkey;
       public          postgres    false    2878    205    202            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     