PGDMP         2            
    {         
   elecciones    15.2    15.2 _    v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            y           1262    212894 
   elecciones    DATABASE     |   CREATE DATABASE elecciones WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Peru.1252';
    DROP DATABASE elecciones;
                postgres    false            �            1259    223751    candidate_lists    TABLE       CREATE TABLE public.candidate_lists (
    id bigint NOT NULL,
    color character varying(255),
    img_candidate character varying(255),
    logo character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(255) NOT NULL
);
 #   DROP TABLE public.candidate_lists;
       public         heap    postgres    false            �            1259    223750    candidate_lists_id_seq    SEQUENCE        CREATE SEQUENCE public.candidate_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.candidate_lists_id_seq;
       public          postgres    false    216            z           0    0    candidate_lists_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.candidate_lists_id_seq OWNED BY public.candidate_lists.id;
          public          postgres    false    215            �            1259    223760 	   elections    TABLE     �   CREATE TABLE public.elections (
    year integer NOT NULL,
    id bigint NOT NULL,
    ips character varying(255),
    logo character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(255) NOT NULL
);
    DROP TABLE public.elections;
       public         heap    postgres    false            �            1259    223759    elections_id_seq    SEQUENCE     y   CREATE SEQUENCE public.elections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.elections_id_seq;
       public          postgres    false    218            {           0    0    elections_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.elections_id_seq OWNED BY public.elections.id;
          public          postgres    false    217            �            1259    223749    grade_id_seq    SEQUENCE     v   CREATE SEQUENCE public.grade_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grade_id_seq;
       public          postgres    false            �            1259    223768    grades    TABLE     �   CREATE TABLE public.grades (
    id bigint NOT NULL,
    abbreviation character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(255) NOT NULL
);
    DROP TABLE public.grades;
       public         heap    postgres    false            �            1259    223780    institutions    TABLE     �   CREATE TABLE public.institutions (
    id bigint NOT NULL,
    logo character varying(255),
    name character varying(255) NOT NULL
);
     DROP TABLE public.institutions;
       public         heap    postgres    false            �            1259    223779    institutions_id_seq    SEQUENCE     |   CREATE SEQUENCE public.institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.institutions_id_seq;
       public          postgres    false    221            |           0    0    institutions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.institutions_id_seq OWNED BY public.institutions.id;
          public          postgres    false    220            �            1259    223789 
   list_roles    TABLE     �   CREATE TABLE public.list_roles (
    candidate_list_id bigint NOT NULL,
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    name_candidate character varying(255) NOT NULL,
    state character varying(255)
);
    DROP TABLE public.list_roles;
       public         heap    postgres    false            �            1259    223788    list_roles_id_seq    SEQUENCE     z   CREATE SEQUENCE public.list_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.list_roles_id_seq;
       public          postgres    false    223            }           0    0    list_roles_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.list_roles_id_seq OWNED BY public.list_roles.id;
          public          postgres    false    222            �            1259    223800 
   role_users    TABLE     p   CREATE TABLE public.role_users (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255)
);
    DROP TABLE public.role_users;
       public         heap    postgres    false            �            1259    223799    role_users_id_seq    SEQUENCE     z   CREATE SEQUENCE public.role_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.role_users_id_seq;
       public          postgres    false    225            ~           0    0    role_users_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.role_users_id_seq OWNED BY public.role_users.id;
          public          postgres    false    224            �            1259    223809    roles    TABLE     �   CREATE TABLE public.roles (
    orderr integer NOT NULL,
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(255) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    223808    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    227                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    226            �            1259    223820    sections    TABLE     �   CREATE TABLE public.sections (
    id bigint NOT NULL,
    abbreviation character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(255) NOT NULL
);
    DROP TABLE public.sections;
       public         heap    postgres    false            �            1259    223819    sections_id_seq    SEQUENCE     x   CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sections_id_seq;
       public          postgres    false    229            �           0    0    sections_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;
          public          postgres    false    228            �            1259    223831    students    TABLE     �   CREATE TABLE public.students (
    grade_id bigint,
    id bigint NOT NULL,
    section_id bigint,
    dni character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    state character varying(255) NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false            �            1259    223830    students_id_seq    SEQUENCE     x   CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.students_id_seq;
       public          postgres    false    231            �           0    0    students_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;
          public          postgres    false    230            �            1259    223842    users    TABLE     P  CREATE TABLE public.users (
    state boolean NOT NULL,
    created_at timestamp(6) without time zone,
    id bigint NOT NULL,
    update_at timestamp(6) without time zone,
    username character varying(30) NOT NULL,
    password character varying(60) NOT NULL,
    last_name character varying(255),
    name character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    223841    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    233            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    232            �            1259    223853    votes    TABLE     �   CREATE TABLE public.votes (
    candidate_list_id bigint,
    date timestamp(6) without time zone,
    id bigint NOT NULL,
    student_id bigint
);
    DROP TABLE public.votes;
       public         heap    postgres    false            �            1259    223852    votes_id_seq    SEQUENCE     u   CREATE SEQUENCE public.votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.votes_id_seq;
       public          postgres    false    235            �           0    0    votes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;
          public          postgres    false    234            �           2604    223754    candidate_lists id    DEFAULT     x   ALTER TABLE ONLY public.candidate_lists ALTER COLUMN id SET DEFAULT nextval('public.candidate_lists_id_seq'::regclass);
 A   ALTER TABLE public.candidate_lists ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    223763    elections id    DEFAULT     l   ALTER TABLE ONLY public.elections ALTER COLUMN id SET DEFAULT nextval('public.elections_id_seq'::regclass);
 ;   ALTER TABLE public.elections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    223783    institutions id    DEFAULT     r   ALTER TABLE ONLY public.institutions ALTER COLUMN id SET DEFAULT nextval('public.institutions_id_seq'::regclass);
 >   ALTER TABLE public.institutions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    223792    list_roles id    DEFAULT     n   ALTER TABLE ONLY public.list_roles ALTER COLUMN id SET DEFAULT nextval('public.list_roles_id_seq'::regclass);
 <   ALTER TABLE public.list_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    223803    role_users id    DEFAULT     n   ALTER TABLE ONLY public.role_users ALTER COLUMN id SET DEFAULT nextval('public.role_users_id_seq'::regclass);
 <   ALTER TABLE public.role_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    223812    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    223823    sections id    DEFAULT     j   ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);
 :   ALTER TABLE public.sections ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    223834    students id    DEFAULT     j   ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);
 :   ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    223845    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    223856    votes id    DEFAULT     d   ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);
 7   ALTER TABLE public.votes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            `          0    223751    candidate_lists 
   TABLE DATA           V   COPY public.candidate_lists (id, color, img_candidate, logo, name, state) FROM stdin;
    public          postgres    false    216   �k       b          0    223760 	   elections 
   TABLE DATA           E   COPY public.elections (year, id, ips, logo, name, state) FROM stdin;
    public          postgres    false    218   �k       c          0    223768    grades 
   TABLE DATA           ?   COPY public.grades (id, abbreviation, name, state) FROM stdin;
    public          postgres    false    219   �k       e          0    223780    institutions 
   TABLE DATA           6   COPY public.institutions (id, logo, name) FROM stdin;
    public          postgres    false    221   �k       g          0    223789 
   list_roles 
   TABLE DATA           [   COPY public.list_roles (candidate_list_id, id, role_id, name_candidate, state) FROM stdin;
    public          postgres    false    223   l       i          0    223800 
   role_users 
   TABLE DATA           7   COPY public.role_users (id, user_id, name) FROM stdin;
    public          postgres    false    225   ,l       k          0    223809    roles 
   TABLE DATA           8   COPY public.roles (orderr, id, name, state) FROM stdin;
    public          postgres    false    227   Wl       m          0    223820    sections 
   TABLE DATA           A   COPY public.sections (id, abbreviation, name, state) FROM stdin;
    public          postgres    false    229   tl       o          0    223831    students 
   TABLE DATA           N   COPY public.students (grade_id, id, section_id, dni, name, state) FROM stdin;
    public          postgres    false    231   �l       q          0    223842    users 
   TABLE DATA           f   COPY public.users (state, created_at, id, update_at, username, password, last_name, name) FROM stdin;
    public          postgres    false    233   �l       s          0    223853    votes 
   TABLE DATA           H   COPY public.votes (candidate_list_id, date, id, student_id) FROM stdin;
    public          postgres    false    235   m       �           0    0    candidate_lists_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.candidate_lists_id_seq', 1, false);
          public          postgres    false    215            �           0    0    elections_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.elections_id_seq', 1, false);
          public          postgres    false    217            �           0    0    grade_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grade_id_seq', 1, false);
          public          postgres    false    214            �           0    0    institutions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.institutions_id_seq', 1, false);
          public          postgres    false    220            �           0    0    list_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.list_roles_id_seq', 1, false);
          public          postgres    false    222            �           0    0    role_users_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.role_users_id_seq', 3, true);
          public          postgres    false    224            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    226            �           0    0    sections_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sections_id_seq', 1, false);
          public          postgres    false    228            �           0    0    students_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.students_id_seq', 1, false);
          public          postgres    false    230            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    232            �           0    0    votes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.votes_id_seq', 1, false);
          public          postgres    false    234            �           2606    223758 $   candidate_lists candidate_lists_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.candidate_lists
    ADD CONSTRAINT candidate_lists_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.candidate_lists DROP CONSTRAINT candidate_lists_pkey;
       public            postgres    false    216            �           2606    223767    elections elections_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.elections
    ADD CONSTRAINT elections_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.elections DROP CONSTRAINT elections_pkey;
       public            postgres    false    218            �           2606    223776    grades grades_abbreviation_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_abbreviation_key UNIQUE (abbreviation);
 H   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_abbreviation_key;
       public            postgres    false    219            �           2606    223778    grades grades_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_name_key;
       public            postgres    false    219            �           2606    223774    grades grades_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.grades DROP CONSTRAINT grades_pkey;
       public            postgres    false    219            �           2606    223787    institutions institutions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_pkey;
       public            postgres    false    221            �           2606    223796    list_roles list_roles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.list_roles
    ADD CONSTRAINT list_roles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.list_roles DROP CONSTRAINT list_roles_pkey;
       public            postgres    false    223            �           2606    223805    role_users role_users_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT role_users_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.role_users DROP CONSTRAINT role_users_pkey;
       public            postgres    false    225            �           2606    223818    roles roles_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_key;
       public            postgres    false    227            �           2606    223816    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    227            �           2606    223829    sections sections_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_name_key;
       public            postgres    false    229            �           2606    223827    sections sections_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    229            �           2606    223840    students students_dni_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_dni_key UNIQUE (dni);
 C   ALTER TABLE ONLY public.students DROP CONSTRAINT students_dni_key;
       public            postgres    false    231            �           2606    223838    students students_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    231            �           2606    223798 &   list_roles uk5q90pi4hu0fjf56lx1hkkh8jv 
   CONSTRAINT     w   ALTER TABLE ONLY public.list_roles
    ADD CONSTRAINT uk5q90pi4hu0fjf56lx1hkkh8jv UNIQUE (candidate_list_id, role_id);
 P   ALTER TABLE ONLY public.list_roles DROP CONSTRAINT uk5q90pi4hu0fjf56lx1hkkh8jv;
       public            postgres    false    223    223            �           2606    223807 &   role_users ukbwhftt1kk6pgi8flracv8iuyr 
   CONSTRAINT     j   ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT ukbwhftt1kk6pgi8flracv8iuyr UNIQUE (user_id, name);
 P   ALTER TABLE ONLY public.role_users DROP CONSTRAINT ukbwhftt1kk6pgi8flracv8iuyr;
       public            postgres    false    225    225            �           2606    223849    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    233            �           2606    223851    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    233            �           2606    223858    votes votes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.votes DROP CONSTRAINT votes_pkey;
       public            postgres    false    235            �           2606    223860    votes votes_student_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_student_id_key UNIQUE (student_id);
 D   ALTER TABLE ONLY public.votes DROP CONSTRAINT votes_student_id_key;
       public            postgres    false    235            �           2606    223886 !   votes fk62rcwode7wb5bko4gr245l44o    FK CONSTRAINT     �   ALTER TABLE ONLY public.votes
    ADD CONSTRAINT fk62rcwode7wb5bko4gr245l44o FOREIGN KEY (candidate_list_id) REFERENCES public.candidate_lists(id);
 K   ALTER TABLE ONLY public.votes DROP CONSTRAINT fk62rcwode7wb5bko4gr245l44o;
       public          postgres    false    235    216    3234            �           2606    223866 &   list_roles fk6bou4imhmat2tq8i7hw3puki3    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_roles
    ADD CONSTRAINT fk6bou4imhmat2tq8i7hw3puki3 FOREIGN KEY (role_id) REFERENCES public.roles(id);
 P   ALTER TABLE ONLY public.list_roles DROP CONSTRAINT fk6bou4imhmat2tq8i7hw3puki3;
       public          postgres    false    223    227    3256            �           2606    223881 $   students fkbu72kq4xd8qjcemytgfxel71l    FK CONSTRAINT     �   ALTER TABLE ONLY public.students
    ADD CONSTRAINT fkbu72kq4xd8qjcemytgfxel71l FOREIGN KEY (section_id) REFERENCES public.sections(id);
 N   ALTER TABLE ONLY public.students DROP CONSTRAINT fkbu72kq4xd8qjcemytgfxel71l;
       public          postgres    false    3260    229    231            �           2606    223891 !   votes fkedp02ocau0clg1eoax2xbmd4d    FK CONSTRAINT     �   ALTER TABLE ONLY public.votes
    ADD CONSTRAINT fkedp02ocau0clg1eoax2xbmd4d FOREIGN KEY (student_id) REFERENCES public.students(id);
 K   ALTER TABLE ONLY public.votes DROP CONSTRAINT fkedp02ocau0clg1eoax2xbmd4d;
       public          postgres    false    231    235    3264            �           2606    223876 $   students fkexo2cgxoe0p8p60y4m6g9hent    FK CONSTRAINT     �   ALTER TABLE ONLY public.students
    ADD CONSTRAINT fkexo2cgxoe0p8p60y4m6g9hent FOREIGN KEY (grade_id) REFERENCES public.grades(id);
 N   ALTER TABLE ONLY public.students DROP CONSTRAINT fkexo2cgxoe0p8p60y4m6g9hent;
       public          postgres    false    231    3242    219            �           2606    223871 &   role_users fkf685pkoo051sx8gk6o3l6116m    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT fkf685pkoo051sx8gk6o3l6116m FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.role_users DROP CONSTRAINT fkf685pkoo051sx8gk6o3l6116m;
       public          postgres    false    225    233    3266            �           2606    223861 &   list_roles fkpj5r9bqjcjpbr7u9vejed04cb    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_roles
    ADD CONSTRAINT fkpj5r9bqjcjpbr7u9vejed04cb FOREIGN KEY (candidate_list_id) REFERENCES public.candidate_lists(id);
 P   ALTER TABLE ONLY public.list_roles DROP CONSTRAINT fkpj5r9bqjcjpbr7u9vejed04cb;
       public          postgres    false    223    216    3234            `      x������ � �      b      x������ � �      c      x������ � �      e      x������ � �      g      x������ � �      i      x�3�4���q�v����� *�      k      x������ � �      m      x������ � �      o      x������ � �      q   [   x�+���4�)��y�*F�*�*��������QQU��������enyIAa^N&)���a��9�AfF9Yz��� Sb��b���� k6+      s      x������ � �     