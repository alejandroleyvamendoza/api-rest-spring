PGDMP  +    9                }            arco-asesores_v5    16.4    16.4 v    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    107386    arco-asesores_v5    DATABASE     �   CREATE DATABASE "arco-asesores_v5" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 "   DROP DATABASE "arco-asesores_v5";
                postgres    false            e           1247    107401    Status    TYPE     d   CREATE TYPE public."Status" AS ENUM (
    'ACTIVE',
    'INACTIVE',
    'PENDING',
    'DELETED'
);
    DROP TYPE public."Status";
       public          postgres    false            �            1259    107410    Client    TABLE     �  CREATE TABLE public."Client" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    lastname character varying(255),
    email character varying(255),
    wa_id character varying(16) NOT NULL,
    manager_id integer,
    status public."Status" DEFAULT 'ACTIVE'::public."Status" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone,
    created_by integer,
    updated_by integer
);
    DROP TABLE public."Client";
       public         heap    postgres    false    869    869            �            1259    107409    Client_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Client_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Client_id_seq";
       public          postgres    false    217            �           0    0    Client_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Client_id_seq" OWNED BY public."Client".id;
          public          postgres    false    216            �            1259    107444 
   Permission    TABLE     �  CREATE TABLE public."Permission" (
    id integer NOT NULL,
    name text NOT NULL,
    description character varying(255) NOT NULL,
    status public."Status" DEFAULT 'ACTIVE'::public."Status" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone,
    created_by integer,
    updated_by integer
);
     DROP TABLE public."Permission";
       public         heap    postgres    false    869    869            �            1259    107443    Permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Permission_id_seq";
       public          postgres    false    225            �           0    0    Permission_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Permission_id_seq" OWNED BY public."Permission".id;
          public          postgres    false    224            �            1259    107421    Profile    TABLE     �   CREATE TABLE public."Profile" (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    password character varying(80)
);
    DROP TABLE public."Profile";
       public         heap    postgres    false            �            1259    107420    Profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Profile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Profile_id_seq";
       public          postgres    false    219            �           0    0    Profile_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Profile_id_seq" OWNED BY public."Profile".id;
          public          postgres    false    218            �            1259    107455    Role    TABLE     J  CREATE TABLE public."Role" (
    id integer NOT NULL,
    name text NOT NULL,
    status public."Status" DEFAULT 'ACTIVE'::public."Status" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone,
    created_by integer,
    updated_by integer
);
    DROP TABLE public."Role";
       public         heap    postgres    false    869    869            �            1259    107466    RolePermission    TABLE     �   CREATE TABLE public."RolePermission" (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);
 $   DROP TABLE public."RolePermission";
       public         heap    postgres    false            �            1259    107465    RolePermission_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RolePermission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."RolePermission_id_seq";
       public          postgres    false    229            �           0    0    RolePermission_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."RolePermission_id_seq" OWNED BY public."RolePermission".id;
          public          postgres    false    228            �            1259    107454    Role_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Role_id_seq";
       public          postgres    false    227            �           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
          public          postgres    false    226            �            1259    107428    User    TABLE       CREATE TABLE public."User" (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    lastname character varying(80),
    email character varying(80) NOT NULL,
    wa_id character varying(16),
    role_id integer,
    profile_id integer,
    manager_id integer,
    status public."Status" DEFAULT 'ACTIVE'::public."Status" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone,
    created_by integer,
    updated_by integer
);
    DROP TABLE public."User";
       public         heap    postgres    false    869    869            �            1259    107481 
   UserClient    TABLE     �   CREATE TABLE public."UserClient" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "clientId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public."UserClient";
       public         heap    postgres    false            �            1259    107473    UserClient_history    TABLE     �   CREATE TABLE public."UserClient_history" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "clientId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 (   DROP TABLE public."UserClient_history";
       public         heap    postgres    false            �            1259    107472    UserClient_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserClient_history_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."UserClient_history_id_seq";
       public          postgres    false    231            �           0    0    UserClient_history_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."UserClient_history_id_seq" OWNED BY public."UserClient_history".id;
          public          postgres    false    230            �            1259    107480    UserClient_id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserClient_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."UserClient_id_seq";
       public          postgres    false    233            �           0    0    UserClient_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."UserClient_id_seq" OWNED BY public."UserClient".id;
          public          postgres    false    232            �            1259    107437    UserRelationship    TABLE     �   CREATE TABLE public."UserRelationship" (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    manager_id integer NOT NULL
);
 &   DROP TABLE public."UserRelationship";
       public         heap    postgres    false            �            1259    107436    UserRelationship_id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserRelationship_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."UserRelationship_id_seq";
       public          postgres    false    223            �           0    0    UserRelationship_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."UserRelationship_id_seq" OWNED BY public."UserRelationship".id;
          public          postgres    false    222            �            1259    107427    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    221            �           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    220            �            1259    107389    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            �            1259    107560    client    TABLE     W  CREATE TABLE public.client (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    created_by integer,
    email character varying(255),
    lastname character varying(255),
    name character varying(255),
    status character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by integer,
    wa_id character varying(16),
    manager_id integer,
    CONSTRAINT client_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying, 'PENDING'::character varying, 'DELETED'::character varying])::text[])))
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    107559    client_id_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    107569 
   permission    TABLE       CREATE TABLE public.permission (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    created_by integer,
    description character varying(255),
    name character varying(255),
    status character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by integer,
    CONSTRAINT permission_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying, 'PENDING'::character varying, 'DELETED'::character varying])::text[])))
);
    DROP TABLE public.permission;
       public         heap    postgres    false            �            1259    107568    permission_id_seq    SEQUENCE     �   ALTER TABLE public.permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    107578    profile    TABLE     �   CREATE TABLE public.profile (
    id integer NOT NULL,
    password character varying(80),
    username character varying(80)
);
    DROP TABLE public.profile;
       public         heap    postgres    false            �            1259    107577    profile_id_seq    SEQUENCE     �   ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    107584    role    TABLE     �  CREATE TABLE public.role (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    created_by integer,
    name character varying(255),
    status character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by integer,
    CONSTRAINT role_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying, 'PENDING'::character varying, 'DELETED'::character varying])::text[])))
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    107583    role_id_seq    SEQUENCE     �   ALTER TABLE public.role ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �           2604    107413 	   Client id    DEFAULT     j   ALTER TABLE ONLY public."Client" ALTER COLUMN id SET DEFAULT nextval('public."Client_id_seq"'::regclass);
 :   ALTER TABLE public."Client" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    107447    Permission id    DEFAULT     r   ALTER TABLE ONLY public."Permission" ALTER COLUMN id SET DEFAULT nextval('public."Permission_id_seq"'::regclass);
 >   ALTER TABLE public."Permission" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    107424 
   Profile id    DEFAULT     l   ALTER TABLE ONLY public."Profile" ALTER COLUMN id SET DEFAULT nextval('public."Profile_id_seq"'::regclass);
 ;   ALTER TABLE public."Profile" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    107458    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    107469    RolePermission id    DEFAULT     z   ALTER TABLE ONLY public."RolePermission" ALTER COLUMN id SET DEFAULT nextval('public."RolePermission_id_seq"'::regclass);
 B   ALTER TABLE public."RolePermission" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    107431    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    107484    UserClient id    DEFAULT     r   ALTER TABLE ONLY public."UserClient" ALTER COLUMN id SET DEFAULT nextval('public."UserClient_id_seq"'::regclass);
 >   ALTER TABLE public."UserClient" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    107476    UserClient_history id    DEFAULT     �   ALTER TABLE ONLY public."UserClient_history" ALTER COLUMN id SET DEFAULT nextval('public."UserClient_history_id_seq"'::regclass);
 F   ALTER TABLE public."UserClient_history" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    107440    UserRelationship id    DEFAULT     ~   ALTER TABLE ONLY public."UserRelationship" ALTER COLUMN id SET DEFAULT nextval('public."UserRelationship_id_seq"'::regclass);
 D   ALTER TABLE public."UserRelationship" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            w          0    107410    Client 
   TABLE DATA           �   COPY public."Client" (id, name, lastname, email, wa_id, manager_id, status, "createdAt", "updatedAt", created_by, updated_by) FROM stdin;
    public          postgres    false    217   &�                 0    107444 
   Permission 
   TABLE DATA           w   COPY public."Permission" (id, name, description, status, "createdAt", "updatedAt", created_by, updated_by) FROM stdin;
    public          postgres    false    225   ߖ       y          0    107421    Profile 
   TABLE DATA           ;   COPY public."Profile" (id, username, password) FROM stdin;
    public          postgres    false    219   ��       �          0    107455    Role 
   TABLE DATA           d   COPY public."Role" (id, name, status, "createdAt", "updatedAt", created_by, updated_by) FROM stdin;
    public          postgres    false    227   ܗ       �          0    107466    RolePermission 
   TABLE DATA           F   COPY public."RolePermission" (id, role_id, permission_id) FROM stdin;
    public          postgres    false    229   $�       {          0    107428    User 
   TABLE DATA           �   COPY public."User" (id, name, lastname, email, wa_id, role_id, profile_id, manager_id, status, "createdAt", "updatedAt", created_by, updated_by) FROM stdin;
    public          postgres    false    221   A�       �          0    107481 
   UserClient 
   TABLE DATA           M   COPY public."UserClient" (id, "userId", "clientId", "createdAt") FROM stdin;
    public          postgres    false    233   g�       �          0    107473    UserClient_history 
   TABLE DATA           U   COPY public."UserClient_history" (id, "userId", "clientId", "createdAt") FROM stdin;
    public          postgres    false    231   ��       }          0    107437    UserRelationship 
   TABLE DATA           I   COPY public."UserRelationship" (id, employee_id, manager_id) FROM stdin;
    public          postgres    false    223   Ǚ       u          0    107389    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    215   ��       �          0    107560    client 
   TABLE DATA           �   COPY public.client (id, created_at, created_by, email, lastname, name, status, updated_at, updated_by, wa_id, manager_id) FROM stdin;
    public          postgres    false    235   ��       �          0    107569 
   permission 
   TABLE DATA           s   COPY public.permission (id, created_at, created_by, description, name, status, updated_at, updated_by) FROM stdin;
    public          postgres    false    237   ��       �          0    107578    profile 
   TABLE DATA           9   COPY public.profile (id, password, username) FROM stdin;
    public          postgres    false    239   ؚ       �          0    107584    role 
   TABLE DATA           `   COPY public.role (id, created_at, created_by, name, status, updated_at, updated_by) FROM stdin;
    public          postgres    false    241   ��       �           0    0    Client_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Client_id_seq"', 3, true);
          public          postgres    false    216            �           0    0    Permission_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Permission_id_seq"', 1, false);
          public          postgres    false    224            �           0    0    Profile_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Profile_id_seq"', 10, true);
          public          postgres    false    218            �           0    0    RolePermission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."RolePermission_id_seq"', 1, false);
          public          postgres    false    228            �           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 1, true);
          public          postgres    false    226            �           0    0    UserClient_history_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."UserClient_history_id_seq"', 1, false);
          public          postgres    false    230            �           0    0    UserClient_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."UserClient_id_seq"', 14, true);
          public          postgres    false    232            �           0    0    UserRelationship_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."UserRelationship_id_seq"', 36, true);
          public          postgres    false    222            �           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 10, true);
          public          postgres    false    220            �           0    0    client_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.client_id_seq', 1, false);
          public          postgres    false    234            �           0    0    permission_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.permission_id_seq', 1, false);
          public          postgres    false    236            �           0    0    profile_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.profile_id_seq', 1, false);
          public          postgres    false    238            �           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    240            �           2606    107419    Client Client_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Client" DROP CONSTRAINT "Client_pkey";
       public            postgres    false    217            �           2606    107453    Permission Permission_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Permission" DROP CONSTRAINT "Permission_pkey";
       public            postgres    false    225            �           2606    107426    Profile Profile_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Profile"
    ADD CONSTRAINT "Profile_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Profile" DROP CONSTRAINT "Profile_pkey";
       public            postgres    false    219            �           2606    107471 "   RolePermission RolePermission_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."RolePermission" DROP CONSTRAINT "RolePermission_pkey";
       public            postgres    false    229            �           2606    107464    Role Role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    227            �           2606    107479 *   UserClient_history UserClient_history_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."UserClient_history"
    ADD CONSTRAINT "UserClient_history_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."UserClient_history" DROP CONSTRAINT "UserClient_history_pkey";
       public            postgres    false    231            �           2606    107487    UserClient UserClient_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."UserClient"
    ADD CONSTRAINT "UserClient_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."UserClient" DROP CONSTRAINT "UserClient_pkey";
       public            postgres    false    233            �           2606    107442 &   UserRelationship UserRelationship_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."UserRelationship"
    ADD CONSTRAINT "UserRelationship_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."UserRelationship" DROP CONSTRAINT "UserRelationship_pkey";
       public            postgres    false    223            �           2606    107435    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    221            �           2606    107397 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    215            �           2606    107567    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    235            �           2606    107576    permission permission_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.permission DROP CONSTRAINT permission_pkey;
       public            postgres    false    237            �           2606    107582    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            postgres    false    239            �           2606    107591    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    241            �           2606    107597 &   permission uk2ojme20jpga3r4r79tdso17gi 
   CONSTRAINT     a   ALTER TABLE ONLY public.permission
    ADD CONSTRAINT uk2ojme20jpga3r4r79tdso17gi UNIQUE (name);
 P   ALTER TABLE ONLY public.permission DROP CONSTRAINT uk2ojme20jpga3r4r79tdso17gi;
       public            postgres    false    237            �           2606    107599     role uk8sewwnpamngi6b1dwaa88askk 
   CONSTRAINT     [   ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk8sewwnpamngi6b1dwaa88askk UNIQUE (name);
 J   ALTER TABLE ONLY public.role DROP CONSTRAINT uk8sewwnpamngi6b1dwaa88askk;
       public            postgres    false    241            �           2606    107593 "   client ukbfgjs3fem0hmjhvih80158x29 
   CONSTRAINT     ^   ALTER TABLE ONLY public.client
    ADD CONSTRAINT ukbfgjs3fem0hmjhvih80158x29 UNIQUE (email);
 L   ALTER TABLE ONLY public.client DROP CONSTRAINT ukbfgjs3fem0hmjhvih80158x29;
       public            postgres    false    235            �           2606    107595 "   client ukj5lxt0dh1uo04ljso0srfe83g 
   CONSTRAINT     ^   ALTER TABLE ONLY public.client
    ADD CONSTRAINT ukj5lxt0dh1uo04ljso0srfe83g UNIQUE (wa_id);
 L   ALTER TABLE ONLY public.client DROP CONSTRAINT ukj5lxt0dh1uo04ljso0srfe83g;
       public            postgres    false    235            �           1259    107488    Client_email_key    INDEX     O   CREATE UNIQUE INDEX "Client_email_key" ON public."Client" USING btree (email);
 &   DROP INDEX public."Client_email_key";
       public            postgres    false    217            �           1259    107489    Client_wa_id_key    INDEX     O   CREATE UNIQUE INDEX "Client_wa_id_key" ON public."Client" USING btree (wa_id);
 &   DROP INDEX public."Client_wa_id_key";
       public            postgres    false    217            �           1259    107494    Permission_name_key    INDEX     U   CREATE UNIQUE INDEX "Permission_name_key" ON public."Permission" USING btree (name);
 )   DROP INDEX public."Permission_name_key";
       public            postgres    false    225            �           1259    107496 (   RolePermission_role_id_permission_id_key    INDEX     �   CREATE UNIQUE INDEX "RolePermission_role_id_permission_id_key" ON public."RolePermission" USING btree (role_id, permission_id);
 >   DROP INDEX public."RolePermission_role_id_permission_id_key";
       public            postgres    false    229    229            �           1259    107495    Role_name_key    INDEX     I   CREATE UNIQUE INDEX "Role_name_key" ON public."Role" USING btree (name);
 #   DROP INDEX public."Role_name_key";
       public            postgres    false    227            �           1259    107497 &   UserClient_history_userId_clientId_key    INDEX     �   CREATE UNIQUE INDEX "UserClient_history_userId_clientId_key" ON public."UserClient_history" USING btree ("userId", "clientId");
 <   DROP INDEX public."UserClient_history_userId_clientId_key";
       public            postgres    false    231    231            �           1259    107498    UserClient_userId_clientId_key    INDEX     p   CREATE UNIQUE INDEX "UserClient_userId_clientId_key" ON public."UserClient" USING btree ("userId", "clientId");
 4   DROP INDEX public."UserClient_userId_clientId_key";
       public            postgres    false    233    233            �           1259    107493 +   UserRelationship_employee_id_manager_id_key    INDEX     �   CREATE UNIQUE INDEX "UserRelationship_employee_id_manager_id_key" ON public."UserRelationship" USING btree (employee_id, manager_id);
 A   DROP INDEX public."UserRelationship_employee_id_manager_id_key";
       public            postgres    false    223    223            �           1259    107490    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            postgres    false    221            �           1259    107492    User_profile_id_key    INDEX     U   CREATE UNIQUE INDEX "User_profile_id_key" ON public."User" USING btree (profile_id);
 )   DROP INDEX public."User_profile_id_key";
       public            postgres    false    221            �           1259    107491    User_wa_id_key    INDEX     K   CREATE UNIQUE INDEX "User_wa_id_key" ON public."User" USING btree (wa_id);
 $   DROP INDEX public."User_wa_id_key";
       public            postgres    false    221            �           2606    107499    Client Client_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_manager_id_fkey" FOREIGN KEY (manager_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Client" DROP CONSTRAINT "Client_manager_id_fkey";
       public          postgres    false    4789    217    221            �           2606    107534 0   RolePermission RolePermission_permission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_permission_id_fkey" FOREIGN KEY (permission_id) REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."RolePermission" DROP CONSTRAINT "RolePermission_permission_id_fkey";
       public          postgres    false    225    229    4797            �           2606    107529 *   RolePermission RolePermission_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_role_id_fkey" FOREIGN KEY (role_id) REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public."RolePermission" DROP CONSTRAINT "RolePermission_role_id_fkey";
       public          postgres    false    227    229    4800            �           2606    107554 #   UserClient UserClient_clientId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserClient"
    ADD CONSTRAINT "UserClient_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."UserClient" DROP CONSTRAINT "UserClient_clientId_fkey";
       public          postgres    false    4783    217    233            �           2606    107544 3   UserClient_history UserClient_history_clientId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserClient_history"
    ADD CONSTRAINT "UserClient_history_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public."UserClient_history" DROP CONSTRAINT "UserClient_history_clientId_fkey";
       public          postgres    false    4783    231    217            �           2606    107539 1   UserClient_history UserClient_history_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserClient_history"
    ADD CONSTRAINT "UserClient_history_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public."UserClient_history" DROP CONSTRAINT "UserClient_history_userId_fkey";
       public          postgres    false    4789    221    231            �           2606    107549 !   UserClient UserClient_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserClient"
    ADD CONSTRAINT "UserClient_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."UserClient" DROP CONSTRAINT "UserClient_userId_fkey";
       public          postgres    false    233    4789    221            �           2606    107519 2   UserRelationship UserRelationship_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRelationship"
    ADD CONSTRAINT "UserRelationship_employee_id_fkey" FOREIGN KEY (employee_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public."UserRelationship" DROP CONSTRAINT "UserRelationship_employee_id_fkey";
       public          postgres    false    221    223    4789            �           2606    107524 1   UserRelationship UserRelationship_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRelationship"
    ADD CONSTRAINT "UserRelationship_manager_id_fkey" FOREIGN KEY (manager_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public."UserRelationship" DROP CONSTRAINT "UserRelationship_manager_id_fkey";
       public          postgres    false    4789    221    223            �           2606    107514    User User_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_manager_id_fkey" FOREIGN KEY (manager_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_manager_id_fkey";
       public          postgres    false    221    221    4789            �           2606    107509    User User_profile_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_profile_id_fkey" FOREIGN KEY (profile_id) REFERENCES public."Profile"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_profile_id_fkey";
       public          postgres    false    219    221    4786            �           2606    107504    User User_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_role_id_fkey" FOREIGN KEY (role_id) REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_role_id_fkey";
       public          postgres    false    221    227    4800            w   �   x�3����q�0Fӣ�n�g�����[XpZr::�x��r����*[XZ�����#��̬���!q�QIYEUYUME_UM_�45m54m������;�Ëw���h�̲�=��5(>���X��C\�14�25ֳ06��=... �gx            x������ � �      y   �   x����r�0 ��5y֐D(���2��R��0b�4�=�vᶫ���?dLʆ��5L�M��W�s3�o<���:ƹ����5lh�K��i��t�1;��m=)�'��
�J��o�Fq`�I�vT�d)m���"oz������dlS �k�k{� A��k/�㮊��vD���-�ǥ5�Wmؑ��f�ӮZ�һ��Ū���- ���f�      �   8   x�3�-N-�tt�s�4202�50�52P00�21�2��3�0�)�D\1z\\\ G'�      �      x������ � �      {     x���]k�0�����?`Hṙ�jY�t�*�*�����ʆܯ_�n����+��'olۢ���g�b���Sq9u�����n\ן�{K޺3H�8c�5�r�px|ɁS.�Nc�&��i�Q_uSiP�#�P���W���J_�Y´��y㗅gQ]�PN�Z]�Ԯ����R5����!�]�x̙I�0$�j�1a����pA����ϴ{���4j���TJ�$�l�H�̿g&b>�(���ꇱ��W����+�!��&
�|�DD��^��$���w��      �   3   x�34��4�4202�50�52S00�24�24�33��24J㔎���� �~      �      x������ � �      }   "   x�32�B.cNKe�i��8�t� Pxz      u   �   x�e�K
�0��u|�^�Aٲ�C�����BK�h�mav�|y����f�����^"�Qo�s�a��Ct��$�T
�9�̔K�(�m2���&A�B��EژVB O�q<�G�x^��e�_���UJn_�s_��0�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     