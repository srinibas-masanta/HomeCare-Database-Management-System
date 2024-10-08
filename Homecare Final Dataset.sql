PGDMP     -    0                |            Homecare Worker    15.3    15.3 W    l           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            m           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            n           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            o           1262    25128    Homecare Worker    DATABASE     �   CREATE DATABASE "Homecare Worker" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 !   DROP DATABASE "Homecare Worker";
                postgres    false            �            1259    25130    client    TABLE       CREATE TABLE public.client (
    client_id integer NOT NULL,
    name character varying(100) NOT NULL,
    date_of_birth date NOT NULL,
    contact_id integer,
    address text,
    CONSTRAINT client_date_of_birth CHECK ((date_of_birth <= CURRENT_DATE))
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    25129    client_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    215            p           0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    214            �            1259    25140    contactinfo    TABLE     �   CREATE TABLE public.contactinfo (
    contact_id integer NOT NULL,
    phone character varying(20),
    email character varying(100)
);
    DROP TABLE public.contactinfo;
       public         heap    postgres    false            �            1259    25139    contactinfo_contact_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contactinfo_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.contactinfo_contact_id_seq;
       public          postgres    false    217            q           0    0    contactinfo_contact_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.contactinfo_contact_id_seq OWNED BY public.contactinfo.contact_id;
          public          postgres    false    216            �            1259    25232 
   department    TABLE     �   CREATE TABLE public.department (
    dept_id integer NOT NULL,
    dept_name character varying(100) NOT NULL,
    budget numeric(15,2),
    contact_info text,
    CONSTRAINT department_budget_check CHECK ((budget >= (0)::numeric))
);
    DROP TABLE public.department;
       public         heap    postgres    false            �            1259    25231    department_dept_id_seq    SEQUENCE     �   CREATE SEQUENCE public.department_dept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.department_dept_id_seq;
       public          postgres    false    226            r           0    0    department_dept_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.department_dept_id_seq OWNED BY public.department.dept_id;
          public          postgres    false    225            �            1259    25261    feedback    TABLE     �   CREATE TABLE public.feedback (
    fb_id integer NOT NULL,
    comment text,
    rating integer,
    worker_id integer,
    client_id integer
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            �            1259    25260    feedback_fb_id_seq    SEQUENCE     �   CREATE SEQUENCE public.feedback_fb_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.feedback_fb_id_seq;
       public          postgres    false    230            s           0    0    feedback_fb_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.feedback_fb_id_seq OWNED BY public.feedback.fb_id;
          public          postgres    false    229            �            1259    25149    homecareworker    TABLE       CREATE TABLE public.homecareworker (
    worker_id integer NOT NULL,
    name character varying(100) NOT NULL,
    qualification character varying(100),
    dept_id integer,
    CONSTRAINT worker_qualification_check CHECK (((qualification)::text <> ''::text))
);
 "   DROP TABLE public.homecareworker;
       public         heap    postgres    false            �            1259    25148    homecareworker_worker_id_seq    SEQUENCE     �   CREATE SEQUENCE public.homecareworker_worker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.homecareworker_worker_id_seq;
       public          postgres    false    219            t           0    0    homecareworker_worker_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.homecareworker_worker_id_seq OWNED BY public.homecareworker.worker_id;
          public          postgres    false    218            �            1259    25192    payment    TABLE        CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    amount numeric(10,2),
    date date,
    method character varying(50),
    client_id integer,
    worker_id integer,
    CONSTRAINT payment_amount_check CHECK ((amount >= (0)::numeric))
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    25191    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false    223            u           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public          postgres    false    222            �            1259    25209    qualification    TABLE     �   CREATE TABLE public.qualification (
    institution character varying(100),
    degree character varying(100),
    title_of_certification character varying(100),
    worker_id integer NOT NULL
);
 !   DROP TABLE public.qualification;
       public         heap    postgres    false            �            1259    25242    report    TABLE     �   CREATE TABLE public.report (
    report_id integer NOT NULL,
    reportdate date,
    description text,
    client_id integer,
    dept_id integer
);
    DROP TABLE public.report;
       public         heap    postgres    false            �            1259    25241    report_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.report_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.report_report_id_seq;
       public          postgres    false    228            v           0    0    report_report_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.report_report_id_seq OWNED BY public.report.report_id;
          public          postgres    false    227            �            1259    25280    schedule    TABLE     �   CREATE TABLE public.schedule (
    schedule_id integer NOT NULL,
    date date,
    "time" time without time zone,
    client_id integer,
    worker_id integer,
    dept_id integer
);
    DROP TABLE public.schedule;
       public         heap    postgres    false            �            1259    25279    schedule_schedule_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.schedule_schedule_id_seq;
       public          postgres    false    232            w           0    0    schedule_schedule_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.schedule_schedule_id_seq OWNED BY public.schedule.schedule_id;
          public          postgres    false    231            �            1259    25157    service    TABLE       CREATE TABLE public.service (
    service_id integer NOT NULL,
    servicename character varying(100) NOT NULL,
    duration interval,
    cost numeric(10,2),
    worker_id integer,
    client_id integer,
    CONSTRAINT service_cost_check CHECK ((cost >= (0)::numeric))
);
    DROP TABLE public.service;
       public         heap    postgres    false            �            1259    25156    service_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.service_service_id_seq;
       public          postgres    false    221            x           0    0    service_service_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.service_service_id_seq OWNED BY public.service.service_id;
          public          postgres    false    220            �            1259    25301    workhistory    TABLE     �   CREATE TABLE public.workhistory (
    employment_dates character varying(100),
    jobtitle character varying(100),
    description text,
    workerid integer NOT NULL
);
    DROP TABLE public.workhistory;
       public         heap    postgres    false            �           2604    25133    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    25143    contactinfo contact_id    DEFAULT     �   ALTER TABLE ONLY public.contactinfo ALTER COLUMN contact_id SET DEFAULT nextval('public.contactinfo_contact_id_seq'::regclass);
 E   ALTER TABLE public.contactinfo ALTER COLUMN contact_id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    25235    department dept_id    DEFAULT     x   ALTER TABLE ONLY public.department ALTER COLUMN dept_id SET DEFAULT nextval('public.department_dept_id_seq'::regclass);
 A   ALTER TABLE public.department ALTER COLUMN dept_id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    25264    feedback fb_id    DEFAULT     p   ALTER TABLE ONLY public.feedback ALTER COLUMN fb_id SET DEFAULT nextval('public.feedback_fb_id_seq'::regclass);
 =   ALTER TABLE public.feedback ALTER COLUMN fb_id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    25152    homecareworker worker_id    DEFAULT     �   ALTER TABLE ONLY public.homecareworker ALTER COLUMN worker_id SET DEFAULT nextval('public.homecareworker_worker_id_seq'::regclass);
 G   ALTER TABLE public.homecareworker ALTER COLUMN worker_id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    25195    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    25245    report report_id    DEFAULT     t   ALTER TABLE ONLY public.report ALTER COLUMN report_id SET DEFAULT nextval('public.report_report_id_seq'::regclass);
 ?   ALTER TABLE public.report ALTER COLUMN report_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    25283    schedule schedule_id    DEFAULT     |   ALTER TABLE ONLY public.schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.schedule_schedule_id_seq'::regclass);
 C   ALTER TABLE public.schedule ALTER COLUMN schedule_id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    25160    service service_id    DEFAULT     x   ALTER TABLE ONLY public.service ALTER COLUMN service_id SET DEFAULT nextval('public.service_service_id_seq'::regclass);
 A   ALTER TABLE public.service ALTER COLUMN service_id DROP DEFAULT;
       public          postgres    false    220    221    221            W          0    25130    client 
   TABLE DATA           U   COPY public.client (client_id, name, date_of_birth, contact_id, address) FROM stdin;
    public          postgres    false    215   �h       Y          0    25140    contactinfo 
   TABLE DATA           ?   COPY public.contactinfo (contact_id, phone, email) FROM stdin;
    public          postgres    false    217   �p       b          0    25232 
   department 
   TABLE DATA           N   COPY public.department (dept_id, dept_name, budget, contact_info) FROM stdin;
    public          postgres    false    226   u       f          0    25261    feedback 
   TABLE DATA           P   COPY public.feedback (fb_id, comment, rating, worker_id, client_id) FROM stdin;
    public          postgres    false    230   6z       [          0    25149    homecareworker 
   TABLE DATA           Q   COPY public.homecareworker (worker_id, name, qualification, dept_id) FROM stdin;
    public          postgres    false    219   �~       _          0    25192    payment 
   TABLE DATA           Y   COPY public.payment (payment_id, amount, date, method, client_id, worker_id) FROM stdin;
    public          postgres    false    223   ��       `          0    25209    qualification 
   TABLE DATA           _   COPY public.qualification (institution, degree, title_of_certification, worker_id) FROM stdin;
    public          postgres    false    224   {�       d          0    25242    report 
   TABLE DATA           X   COPY public.report (report_id, reportdate, description, client_id, dept_id) FROM stdin;
    public          postgres    false    228   ��       h          0    25280    schedule 
   TABLE DATA           \   COPY public.schedule (schedule_id, date, "time", client_id, worker_id, dept_id) FROM stdin;
    public          postgres    false    232   	�       ]          0    25157    service 
   TABLE DATA           `   COPY public.service (service_id, servicename, duration, cost, worker_id, client_id) FROM stdin;
    public          postgres    false    221   ��       i          0    25301    workhistory 
   TABLE DATA           X   COPY public.workhistory (employment_dates, jobtitle, description, workerid) FROM stdin;
    public          postgres    false    233   ��       y           0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);
          public          postgres    false    214            z           0    0    contactinfo_contact_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.contactinfo_contact_id_seq', 1, false);
          public          postgres    false    216            {           0    0    department_dept_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.department_dept_id_seq', 1, false);
          public          postgres    false    225            |           0    0    feedback_fb_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.feedback_fb_id_seq', 1, false);
          public          postgres    false    229            }           0    0    homecareworker_worker_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.homecareworker_worker_id_seq', 1, false);
          public          postgres    false    218            ~           0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);
          public          postgres    false    222                       0    0    report_report_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.report_report_id_seq', 1, false);
          public          postgres    false    227            �           0    0    schedule_schedule_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.schedule_schedule_id_seq', 1, false);
          public          postgres    false    231            �           0    0    service_service_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.service_service_id_seq', 1, false);
          public          postgres    false    220            �           2606    25138    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    215            �           2606    25145    contactinfo contactinfo_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.contactinfo
    ADD CONSTRAINT contactinfo_pkey PRIMARY KEY (contact_id);
 F   ALTER TABLE ONLY public.contactinfo DROP CONSTRAINT contactinfo_pkey;
       public            postgres    false    217            �           2606    25240    department department_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_id);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            postgres    false    226            �           2606    25268    feedback feedback_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (fb_id);
 @   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
       public            postgres    false    230            �           2606    25155 "   homecareworker homecareworker_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.homecareworker
    ADD CONSTRAINT homecareworker_pkey PRIMARY KEY (worker_id);
 L   ALTER TABLE ONLY public.homecareworker DROP CONSTRAINT homecareworker_pkey;
       public            postgres    false    219            �           2606    25198    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    223            �           2606    25213     qualification qualification_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.qualification
    ADD CONSTRAINT qualification_pkey PRIMARY KEY (worker_id);
 J   ALTER TABLE ONLY public.qualification DROP CONSTRAINT qualification_pkey;
       public            postgres    false    224            �           2606    25249    report report_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (report_id);
 <   ALTER TABLE ONLY public.report DROP CONSTRAINT report_pkey;
       public            postgres    false    228            �           2606    25285    schedule schedule_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);
 @   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_pkey;
       public            postgres    false    232            �           2606    25163    service service_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (service_id);
 >   ALTER TABLE ONLY public.service DROP CONSTRAINT service_pkey;
       public            postgres    false    221            �           2606    25147    contactinfo unique_email 
   CONSTRAINT     T   ALTER TABLE ONLY public.contactinfo
    ADD CONSTRAINT unique_email UNIQUE (email);
 B   ALTER TABLE ONLY public.contactinfo DROP CONSTRAINT unique_email;
       public            postgres    false    217            �           2606    25307    workhistory workhistory_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.workhistory
    ADD CONSTRAINT workhistory_pkey PRIMARY KEY (workerid);
 F   ALTER TABLE ONLY public.workhistory DROP CONSTRAINT workhistory_pkey;
       public            postgres    false    233            �           2606    25274     feedback feedback_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 J   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_client_id_fkey;
       public          postgres    false    230    3236    215            �           2606    25269     feedback feedback_worker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.homecareworker(worker_id);
 J   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_worker_id_fkey;
       public          postgres    false    3242    219    230            �           2606    25199    payment payment_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 H   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_client_id_fkey;
       public          postgres    false    215    3236    223            �           2606    25204    payment payment_worker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.homecareworker(worker_id);
 H   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_worker_id_fkey;
       public          postgres    false    219    3242    223            �           2606    25214 *   qualification qualification_worker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qualification
    ADD CONSTRAINT qualification_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.homecareworker(worker_id);
 T   ALTER TABLE ONLY public.qualification DROP CONSTRAINT qualification_worker_id_fkey;
       public          postgres    false    219    224    3242            �           2606    25250    report report_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 F   ALTER TABLE ONLY public.report DROP CONSTRAINT report_client_id_fkey;
       public          postgres    false    3236    228    215            �           2606    25255    report report_dept_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES public.department(dept_id);
 D   ALTER TABLE ONLY public.report DROP CONSTRAINT report_dept_id_fkey;
       public          postgres    false    3250    226    228            �           2606    25286     schedule schedule_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 J   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_client_id_fkey;
       public          postgres    false    232    215    3236            �           2606    25296    schedule schedule_dept_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES public.department(dept_id);
 H   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_dept_id_fkey;
       public          postgres    false    3250    232    226            �           2606    25291     schedule schedule_worker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.homecareworker(worker_id);
 J   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_worker_id_fkey;
       public          postgres    false    232    3242    219            �           2606    25169    service service_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 H   ALTER TABLE ONLY public.service DROP CONSTRAINT service_client_id_fkey;
       public          postgres    false    215    3236    221            �           2606    25164    service service_worker_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.homecareworker(worker_id);
 H   ALTER TABLE ONLY public.service DROP CONSTRAINT service_worker_id_fkey;
       public          postgres    false    3242    221    219            �           2606    25308 %   workhistory workhistory_workerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.workhistory
    ADD CONSTRAINT workhistory_workerid_fkey FOREIGN KEY (workerid) REFERENCES public.homecareworker(worker_id);
 O   ALTER TABLE ONLY public.workhistory DROP CONSTRAINT workhistory_workerid_fkey;
       public          postgres    false    233    3242    219            W   �  x�eW]o�F|^�
�����F��N�8h��/g���H�������G�<���4��rvnf)��a�7?�dv#�FZ�$�nR�7��E?�>7����é(6Rl�%Eƺ�S���}�7�n�v��wz�a#�F��Cl�=W3�ex������6�\OU%Ȑ����q\����kS�.��6q�q#�F��B�/]檎.�7��<]lD�hA��������R�ӧ�}E�/���~;����H���<a�7���q�@�\�!�G4�'#�
�z
d�m_��v�6��~����\zp�@Er���}��$��8�]����{��@�(
�y�V����Լ�c���Q0j6J� ��WUtwܥ����߸M��)L����/%5�tHO��R�5��a�a����	L���E=$�y������KO@��P
_��y�� �c����fZ�����S��=��%"��x��0�[00ra0�X�m�S��(�χJ3�e�@E@'FEp���4v���;� �9��1�&��=��"�(Y:*�/�\�V��O�t����(�ra���3N�������x�����Ɨ<�$�_7PX	)��<�E�.�ȡ8�JJU��=��]��E����.�+�k�����ܝ���Ѻ�O����"�����Ǖ���k�	�2�.�܁<�'ac�����J��Aw_���bT�щ�W�����[ZT�	D Q^��j-�ëE�I��$Z�q�Y+��=���55��DM������yQ5*+�. @-��Yֆ��k����L(��R����J_�� ���J�vp�~;t������D͍(3�=��6�r��q��G#��ch��M\��|��� i�\�1��������P~!�`x��+5�b�P3`�U��6�ޟ�Y���9l��2܌�5�F��ǴH��6	��ZT4M��Zmϓ��'�Fh9sm���j��m��Fj5�l,�."���Y���2lݦ���/w���TO����0�^f�Pt���m+��E�;�j����ڭ��.=�-�R��F`㴯i���t�̂�\-a�x*����cI�Y҆ǂ��g����i��R�!�^� 4ш�k�����*�w�������Yh=��gT�7�ɉ"���ahy�9��ڢy��<#�V�*�C����a�M��8`�Y���|��Z�G/�U(Z�GL�O����,�c���NE��g�wx�R�uf	E'�Uغ�=`�A#fIC'�ݐ+i�w �f�B�xEI�Y�Ε�Km�N��-��|u�� p�V!���|8�EӅ[� '�*��'aI�틍z�]��s�+�U�*�?��Ӷ�A��+�Ӟ׎)dQ?c�t�s.�q5g�aa u�.1�"}Le�}�x��{buv�B/�I�=^��i,�Fvކ�D��������QK肍5�^�~ɹ�"Ql� �E'j����j�ew��'�=�����#.�,y����Y��O����W��b�lѐ�3��ч3���U���� �33���/�U�і���{��l%V��ڢ�Ņ˖'P[�*�#}(�r�+GQ���;�k������j��8� �ޅ�� �G��>!��5��Ŋ���i��w��H@<�w�8h|���u@K���r�8��Z*1��_NP4nЋWW��E*�82c���؃@��+KH���_�i0�"�8w�W~<�Y�:e9�N �2� ֑7�Y�~
TE������8/Z�Vy�S���/�s�g��/n8��/�%�����N��� (?{jD.����DP�oV:�����x^��׼|� �"T���3V�ZVD �(��W����e嬓isi�TX9ktSr���㆛�:Ծ=}n�˨rUY�H4aq���s���Bqx�X�a����V*uŗp�]�_�Pb�?*���kt*K�㇛��K���      Y   d  x�}��r�(E��_�J���|�l�
e���d'���U�EcuƻT0-�G�ۭj�����d�Ш�yJ����?h�E�g��V��'�w��n���_�Nբ�j����>��Q���͖��u��������J������K��W�ړs�4ࣖ|�]����u�W���^����ʖW�*��T�k	׻���:^ک}����Ӻ���Ǫ���Å��N�LS��7_?\��ZE�|I�^�J�U���D�-�k���è����H+m1�zi�ȠfBds���U�w��p[�a�˘/�SX���q�F́�Ö�vU-���"P�VY85NTb^WU�#�����]C�p�U.Z��H������
ωEGu͠�7_d5���l$uV\ �Q�p�F���[x�U<�������T�*%,����<���e&��s�O�b��@��5;�ӊ@�5��U~���#�Ŋ����7�H8���U�  	��g���&h���Ic�"�x�X]���F/��Y�N��R�vD���'�2� ���¯�2�ȕ��t�I�AD����B����Ġ�1✬����#�xVv 3A ߮Z�M v�U���K ��α��Q#vD���a7Ծ�B!�G�D�d��DlX#����Z-���8��~�oT�|�h����_���ȹ�\�z�|9������'p!#�s���T²�e�u�̷Ɵ��]M9!�$Q�s���k>��4\e�AˑP���m�b����π�N�K�M�N�HZ4]�1(n�9 i���ei4\e����(�l�v���G���*������D��6Þ�-xP�H��*źD���>�eЂ�E�,w�׮{y��>)�g4�g�+W��?�r�a��~�m�ԃ��&�M��f�T��ማ�jk�A����!7&׷��G�����7Ǖ�h���� ���0��͸�#j�)�3���>k:dE&��%�����!��/?<��)���,+�q�5F]D�wZdX
�B�5ǝ��߃����ָ����k�N�g��\k���Uj��~V-���M@m�n���gH�ـ�߼��춁�m��֐$��l��[�t�m�^yo�8��j��6o$b�6�i���h��`���� ��      b     x����o�F������ؕ�0�s��6r��q�>�Bٱ�
lT��}k'�6�13�)3/���kg���8TeQ'w��c��~<�fd2�?�iʮ�f,��]�K��M"��jc�_�?�EU�K�q?����W��]���"g����c�6�5��s�I��[�M3Zjg���j^n���r!7��f��Ӷ��Zbo�v�s�=9�I�d�0�O#��-�	�}t��p5�0M�^Nf6�f���la���b�b7��%7���CrU�_�/���pF�i��i�Á����X5�����0?$8�M���մ}qނ`���X4�7���tëh>�f���la������������*�=����mw�g��h��!ma����7#�e)�|*�j|<?�S��������$pZ[c�9�R�#����y��	���y-�y��l���������nں}x�ԇG]QQg�}pP�rpx��y%��`���몄��~�ϕ�G�QoS&������Xz�B���� �>�?n|{�����?VS4�������<�WRv}F���d��o��7Uͯ$��`�mߖ�޽=v��+�~��lK٧���wH��N˩��.	<�rZN��ه����=h<���jj g�S�Տ��.�UAO������e�j���~ZN��l���8��/��ynx������*��P�=�:�!<t���`!q�q/3��u᱓�4�!<�%�x��7���2�gN2�y0Cx�>��b���{�!.c��&�>�"�+�3�u8Cx�^��	g�������	�iCx�~�D�Q����"�U�=H��8����U��rx�$B!����бH���H�	<s	a�����!!� $����Y,�7��<	�b?��#��EB�p$�HH���	�b����#!u$x�$ҬE�ڃ���H���H�4	<�e$T�	<s	�!A|�^@B�X$��I$�X��9����HP?_FB� $���P:	<i�bR&	�b?ʆ#��EB��H�1{��Y0x�>$t��	�#���&��b-x�$��Fo�DB�@$𼗑�zx�$�!������HP?'�t-x�$&F�ۇ�Ƀ� �^@��X$�ɋɈ$��j��02	�`/F�#���E��`$��}H��	c#����3��E�ڃ�͢��'��y x��HX�	<s	+���_B��X$��I$�Z��9����H�y���&	��$��EO���8,W�د��ˋ���.b,      f   �  x���Ko�6��<�B�n��|�ˢ�k�m�U7����Ȓ+�ɴ��G�'cg� $���s���{�Y��}����C��z���OU�s���1Uu�T�zl�ݝ0B
	%���M]GA5��ݦ�8�m�����j~��NX����^�O���y��SuFzO�v>���Zh��~x�R�K�}wc���é���+~��vz���@�%�����\��p���jK����︈�ۘG~�Ѵ��2��v�_�૩��-�eE'��a���p8��ߪ�C�u�y���ͥ��4r�d���2�c���A,[d�i�8�+������5��P��%�<F7�-Ӵ,���˴d2���4��S=�ۼ,Qm��z\RB��@J��a/ϒ�X6��K�X�;^��KJH%~�R=��śd���8 ��yM��-������]Όjƨ!�����3[��Z/�vUKi��u;~��vM�s��qZ|���YA��tk����s^��0��nk�&� ���MTw]�[��S�,��]z��p���|x�/��8t�|Y{�dqh��K7��z�Ա�Ǜ*i{v��r�i�ڼ�Bov=j%_�{{qL��q���U 9��%����}wj��߮�C�RPZ�Ƃni��nU7�4&��;e��Ss���+u�Onjd�������������;�G��^����MrEN`�n�����>M��]�A�Q?ύ���B��Po�/Wm�xv���1/��.�ߨ�W������y;VP�%ty��\�=�at:�?�j]� ���.�m�A��N��sXDS��.�m:�d �Z��)]F�d�j�`�$J��� �bc`�D��0%@��8�" �e<L��6�H��[ $z�6HT[	[$ڬ���V�������@��Z�" �el�h�6H�� [$�l���n�$ʝ���N��H�:�$j��+M�OE��E|.rp�@��y�< Q�\�hs>H��|���>HT{�~ Q�5|�(�>H�{_$�<���D���Y@���r ��#B��	�, Q$B�h
!H��$�A(}�"���ʀD[��@�>�" �"b�(��< Q%b�(�
��@�4j� Qb	�h��H�E�X$:�G��1 ������wv�K�����      [   �  x��W�r�8|��B?�[�n?�	���M�־h����%�d�����[�L�B�������'w��'��KUkE�|'����GSs�{Y��d\���Y����+Q09<x!��C)]2���Ǉ1'ԎN�L58:"�BJ�*��_n>^L�I�3�)#s]q:�L6%��m��V�ⰶ�Uy��k=�ܰTJ�����ֈ��V�k�V�{0�2rהL��k�9p^��-��َ�kJ-u{K �䏚}�R2��NR���z�qWI��٣,��'�u޲WQ���}��P�QLmq����,���
G�����]w�RW'��ȣf�Э�^4&�����әdf���	���_V	E��!�CC*.ے�����e����jg�3G[�9��U�g���&ǅ��{�B/�!�bO�������  sf�Я��F2�Cr˔@�ܹ�D��˓���s5*=@�o\�zg7N�����DgZ�nrpX����aC[���,��xffkS�CRs��s�#l��
-��[G/'>�������z���o�/��P�>*
�!Y�WAלomU��4��gZ�d������~O�bi�%d�T`�g������qJ#���Nt��ڣƕ�M�-���6�tyxo��
������qW�V�Q�ɜl�F�{�kcĈY��?E�h�xX<g�7��MM��F�$+�QBPaM�v�!�P�(j��
�Q�KmW{M:�� و���vc���J���c#9�Iow��/Ȧ@J��{���ሞ(z+�u��%ə��i��)���n���F�>'�8%����cJ��^y��r�nsGD29��##��l���#�&�yu��*�B�d8��Vv� ��Nn����0����$���]��8N���T'Y��+���Fs��}�X��0������#,�~����`]�ܵ,<�^��\l �a?��k��4��~���M�~-<g��4���ޱ�7�������yG��}���p6�Cm@����삁)R��n�:� 0&�94�)�"r��~Ⱥx��^oö4Ns���)�,o�1�Y6d͙�1��KP�և����^2d�������q2�}k�y=Ns�������C.��h(z��_ˉ<~V�F���%��v~ޣ�l����b�g�ol7������NQ���0	�Q�d���=�����      _   �  x�e���$7�c�S����%��ęgNθ�����Kݽ�M. `0�4M��)���_����E��!��������۷�ߛ4����h{����M�Z���_�?�f�&=/�������z
�[G4��&�!�Ƨ]�+�h�n�?~���6�>�~=�ڂM$�����M���.RA�h�O�g������;�A�͌=Ǣ��|V^�S,����8e���e:r$*> �63E"��Uw��CQ�=j~9�w�{*5G�y��7e�j� }/RV�B�'���W5(���U�<c9��8q���(%͉*8��&�3�t�J��dr@���HAlK��q���<8`�O���X$&0M�����;�� ,�O���9��2sX��>@n�<Z���6�v�������e?��)�䀭�-�@n^�A_�@�\R�������ns�&p��՗+�8�Ջv�����)��wx�Z�\��>�x��}�g�S�r��Uk��p{q��X�t5�R���@�]����@��J��{'����-�w�d��»/��E���=�GM��}�Ϛ�w_ �}UѲ/���8j~�/�ǁ���}�$��9=���{$�Z�n>�0�?t��k�$�?Ļ���p>�!<[���&�@��vת��Ib �vεM�4�k��O��x:�ێdRD�\��C0��&��ɇbXM�&��E4ɗ�p�^œT��cDO��&��FOru���1�xrU7����'wu���yT�ruo~`JOSu�O��*���M2ӊx�1��h��U��9�c�������QT�|�m������#�lsg�v�91W�N���:>i�;�K�vv_{$K��hg�6W,�ڝ}��0�2,���뽃d9VOڝ}G
��4��ڝ���@t��Y���8c��X3�w�){
�M�,ޫ� X�M�Ȳ]���*q"�����ẻ      `     x���]o�0���_�;�@k�}96D�mTZ'��M�k�]�Π�wӠ;�c'h�.��9���4w�>��Tb~_���s�(�]�@���%4`�j�֤��-�?� �ח�l6�naz�6�����=�[���6_��?-qn���^uM�6�!���֠�I�$⑼�׊�`vۧ4����i��!uн�d��IEU�����7��n��o��"��I���Y�,�N:8g��;��@:���th�<��]��Pb���ӿ[*����~MkR��� �����]Z	R�b�ŀ�^E�v{T�M'ׁ��g[}��۹�Tj�����g8�V?�p#��.��h�0&�#9Z�,��X�k�p0����$��tg�^�}�0�>���^h'Y�7K��Ϣ���^�q�_D�\�]wW�$��(��L�P�΋h}L���0t|��b^r]�/�_ r�U����u�%=}]`�^C��`0�W���Ö�I�L,�Z����#lڗEb�a�����!�9��w���Ж�{`\j�
��fZ`�%��F���o�X4,���4�dp�*L;��)�K��?����D���\��@nz�	��@f�ik�U���B��#F�*�*~�u0(�L�' ��0����<�M�K�CFJ�f/��Ajsw��&�)�2v�i�I)�/6��E)m�(���I�U�%lvg�"X����Sמ�gN��vaR�l�k/�8l|H�p��H�K֝���=	�2,\[{���������"v��$�b�����ܓ��d�a!�;�]�㝓�ݜǑ�=9V���A��X�.�yܓc����qO��:�=9V��=gG�5l7΀r�Z� _A�/O�<t>�J�L�X�SmS�);�9�4�<P*�F�4!���������"l� ����֔n��tN�B�T�v�9���u�sJ7a���E����3u�S��:��)�|sK����q����?�Uv��k����Ƶ��֑�Ze'�q���u�{��C��0�ȶ�#v��S�!;�s��Y��]E �j�%      d   ^  x���Mo�8@��+��U#��o?#�z6��@$3��s��4U�-UUԖ�r8�I����|)d��k]?醴�_���ط����G��<Ww�_���4�ø��ۮ��Y��9#���f8�8�n�����\��k��u��c��������������/ۡ�D��,�e�����ɮ���,qn�nW��<rӮ:�n�ͣ�f| ,d���<���VS��Ǯk�~a������z��>��%���`��op����yX6�.s[���X���}&3�+¬�=�	p�j|�^;�h����ꏗ�����i��bE��������M�'�C�a���f��>�p�ز7XM�p�k��U�~��9�����3��Xr3�33�G�;;�G��+�_���g��?`�Xˌ��OG}r����V���cC�xY.(_�k�	�X!���olG�KF,I#��YNޡ���A�5/9a�j��,�j�b��Gd��,����*�[V�,#���.%A���Wì�i�><	��0T�T3�!]^�&�Vݓ!�"�Ժt��%j^��c��	��K��4�ٴ l��]��ˬIܪs�܃�C�KK�0����]���xdN�;���@B�YA�U���j���~��Z;�'��V�9�������Fͷ��Z��ov:��	_w����Px��ܤj������	B�{U��_Կ�C�$�f^?�}{�B�"�F��f��e`�:Ӂ�m����Mg� ��������#��3K����r3�2qT���W=ȉ+y8�ϫ���|�]�������n�v��y�������1�X�����Hɹ��&~�|�rv�aO�l�Aչ$NJ�9����cK��������/wl���\Zd�9Z�a���"<rn	�u����H�Yh�XM��Y(�`D�Ϻ@�����B]*!�]�XIY(�PD�Ⱥ@Ņ���\�$d1���J˺@�eA���K�]���ԬK�]2�%d]��+>�Hɥ�جK�_�$NJ�%�.���.�y�-2����0qYGB.-a��.�uU)6�
MW��:1�
EW�h�YW����u��J*!�
]W�XIYW��E���+T\���ʺB��!HB��+K���+T]��ϺF��*�IͺF�5#\B�5�9�Ⳏ�\���ͺFյ$NJ�5���������:�"���zm�u$��&:�]7�b�n�t��n�nPtÈ�u��P	YGJn��n�u#���u��E���T����ʺ���$d1���J˺A�mA���[��.���惤��[��2��[���-+6�Hɭ�ج[T�J�dݢ�V,)���:�"�n�zk�u�?D���κ�� � Tl����y��F�e�      h   �  x�M�Y��@C���$�T{�%�?G��h�H��~݄˟x#�q��������籐�;~iz�cI^z���B/�X����O/�y�����*�>�������k�}ǭ��|��'l�|��'���D�q~���v~����Z�{-��pB�O�6�g�Z����pqB�{xaa�P��=��2-������p�	l?Xga�������e!jA{w��5�������B�.jh���\�e!jh/Tʙ�E�J�p����?Lʕ�E->���X.jh������pQC����=fY5��yZe�P����rbSȎO܂��Iv�2�R���rb$S�]�2KUvs�,KMvsȉ�L]vs�t,�C�!�,��f$�<�-�Sy�C�cY���rfB��1��9�̄fQ[	ݻ3�E��<�!g&4��W1����,j+�{wca�����ݝ���H�3ZDm%t�.�����ݐZDm%t�\��"jL�a��Q[	ݻ3�E���!&��z�C�cEԘ��raB�����ݝ��Ƅ��X��е��JVE��<�!W&�Nj�e�/s�t�&�!�+Z��$�+Z��,��|oV�E�!W&�6�U�!W&�v�M�!ӱ:dw1�\����b�f�5�6|�C�cM���rcB��y�9�Ƅ6Q�;�0�Lǚ�1��9�Ƅ6Qc�sȍ	m�6_�gwca��!��9�Ƅ6Qc�sȍ	����v�Ya]��s1�ܙ�.j�@�Lh5�0�LǺ���b�3�]��s1�ܙ�.jQ�2�U�!w&��|�C�Lh5�0�Lǆ�!�����l�|�CL���}�j�|�CL�Ȳ?�ȃ	E������*�so�<���d�-�:��Ͻ�W�!�so�<�-����������?JR �      ]   �  x����NAD�S_�/@������P.\�D"�\�Y�V� ����$.QvZBbS��%�a��/���ps��|\?_˾}���S��/�_���˧������a��9=wo����}����8�o�Aʷ��ӹ��q�}����^��vZ����x/-_���sݿ#�w�?G�(�\=�ZvW�����t��>n��5�9`��������!9��7W���U*/��Z����W`4�M����<U�S�7�x<1Rg=����s��Q`6�S&'wj+Lm����x<��ۃ�靚��R;5%
�&vjF��ݩ�6wrv��;փ����0��IV�M�$�009��4b���N"�d�-�zH��b�@���^!)w��ַb ��`7$#q]�!	�k%���6��)�����*1�m�����v�CW�O7h��:���<�At��b����nX���XKx܄X��D�R7�iشǭ���9�a��`=,�qr`I��Ky�W�Ч=�1����n�ǻ�=����AOz�w��S�N���;߇w�m��`7z��֣'<�x��ވ��<�B|�����=��nx���YOxܝx��>���<����i���������x|4^`$<>���Ǉ����0�0�=>:1��n����`=F��#��Hz<VF��Q	CL{<��m�����x(�	����Hz<:Q����	CL{<1��oT�݈ܗ*k?"�
9Xs���~\ ���'      i   �  x��Y�n�8][_�p@R�e����L1��lX���Ȓ �N;_?�oґ�رERۼ���y\��-��N]HA[L��|eU]�&�4��8�v���XV]9u�Ҷ
��0�1�۰�S��),��68 [D�8Q+C�hK��o����ҟ�ӛoCw�+�p=�r�VEhu�[���x�����aCx�l��-F��I6���F���l�=||��]k�E�C߰ԁ���?ꦞĺa?t��`�(-A�mP�E�6B����؋�{5��������aE��W�ԧ�݅���xYv�6�Ɇ���>lb��t�r8Y:�1/��;���,�	zg�5�X�8�{6��9MK��qd����OP,��ryD���$��=c�~�mwG�c�7:�';~���O�9�I�t�����c��I�2>Ӧ����z�xH(�*�d^{a��������a��Or?��V�_l��*�4a��X���L�sx�h�3��J[ت�U���ؙ֭�;���<'���9������I��+�p����æ�烉m�@�2�s~��1��%X��m�x�z�1:>�M[���c����[�`�V�Lu��"��z��$
��&��6'�6c~��:MGG�&��~�n.,W��X�8��L|�D6���Y��p�Cx�'=ptpF�G���e�FJV~�q������xQ�_��T�A^])S�:�
$8VǕ[�G����Ě��!D}`�La����Y�M���{ƹ~��q��A�ȏ�s�G��0���dQ��(�7�3��_/@��z�����0	TH��*�BB�Ź�bɖ�U�}�Z8A������	�G� �� uX�6�9��� Q���,Hg���P�˽�U�#{����Y��<~�9KqZ��/�b��� �H�Y��u��apeJ+~�֡� �\(aum("8tۣ���x`;
}Y�ю"��Ƃ��»TlI���zl���
���=^D�BaoOď)z+���D��Vz#�?(��B�D�,�X�k<�RTE���O�-���S���a8� ���y��af����(P$SK<��I�q��"���?\ou�r���J���UG�
�r�	"E��Ӱ@,M��p�>|�b�;��5�IoTk$(�`�:XQ��� 6jH�<j,J."
أi�Is�{�,�Qr�!q��B�ъ�G,ᱞ�]������}����0��g�ƃ$�K���_�1^a�(5r�z̉�m�g1���;tm� ə3�g�~+ʍ�a�p<�<�h)��@�h9ԑY:R���H�/�%�t\Ya�P�&��#�Qn1%�[�ku�v!Vv��K�����L�Θ��,d(K�l� �4D������تaGFX]�ó4�3�'4������/���7���Jr��6�A;�8�j��j�����L\�3�f����5-}{\��Z��v���HΦ!.�^�g���X��5�ؾ/�����=B�=ǖ�6Y��L�!-��Ev���p��rSAv�T��Y�Ǎ�'�ɻ���$��'�!~5���j
8�����=��SCM�|���07
r�~_��8�̘0왰e5�7a�f'?L
^P%7�x#/23_[��|�k���Vł�wOu�1.24E<��^�V�W!�k��pҥ3�P���"ތa��/�,o��`���h�k��q��Z��F]x��z��&F	�fbe n��Sg �\��~gp��J��w�����է����_�W\}�zO �]��>s\}����WU��̺zW�k�x��Ϭ�1g�)�e��Gn|��^��1��`��j��Y��<R�pn�
�e���.������g��;�&�iX����e�k��ϢY���aY��IsC%��ò[��\�va�|mX���\�Kg)�ò\g��LT�w�oNT��w]�̓�93O�;��<> g�y�93ױ�N9�@��sf��{������3;�c�,��9��	�9�H/��w��"�3�<���Y�G�L�P��C�D!]     