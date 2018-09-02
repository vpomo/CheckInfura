PGDMP     '    :                v            tokendb    9.4.10    10.0 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    tokendb    DATABASE     e   CREATE DATABASE tokendb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE tokendb;
             token    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7                        0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16459    id_new_wallet_seq    SEQUENCE     s   CREATE SEQUENCE id_new_wallet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.id_new_wallet_seq;
       public       token    false    7            �            1259    16386    id_task_data_seq    SEQUENCE     r   CREATE SEQUENCE id_task_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_task_data_seq;
       public       token    false    7            �            1259    16388    id_task_history_seq    SEQUENCE     u   CREATE SEQUENCE id_task_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.id_task_history_seq;
       public       token    false    7            �            1259    16390    id_wallets_seq    SEQUENCE     p   CREATE SEQUENCE id_wallets_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_wallets_seq;
       public       token    false    7            �            1259    16461 
   new_wallet    TABLE     �   CREATE TABLE new_wallet (
    id_new_wallet integer DEFAULT nextval('id_new_wallet_seq'::regclass) NOT NULL,
    address_wallet character varying(42),
    private_key character varying(64)
);
    DROP TABLE public.new_wallet;
       public         token    false    181    7                       0    0 
   new_wallet    ACL        REVOKE ALL ON TABLE new_wallet FROM PUBLIC;
REVOKE ALL ON TABLE new_wallet FROM token;
GRANT ALL ON TABLE new_wallet TO token;
            public       token    false    182            �            1259    16392 	   task_data    TABLE     �  CREATE TABLE task_data (
    id_task_data integer DEFAULT nextval('id_task_data_seq'::regclass) NOT NULL,
    from_csv text,
    id_task character varying,
    put_date date,
    count_address integer,
    amount_token numeric,
    active_task boolean,
    number_times numeric,
    real_number_times numeric,
    remain_number numeric,
    current_tx_hash character varying,
    id_wallet integer
);
    DROP TABLE public.task_data;
       public         token    false    173    7            �            1259    16399    task_history    TABLE     �   CREATE TABLE task_history (
    id_task_history integer DEFAULT nextval('id_task_history_seq'::regclass) NOT NULL,
    id_task character varying,
    status character varying,
    id_wordpress integer,
    start_date date,
    end_date date
);
     DROP TABLE public.task_history;
       public         token    false    174    7            �            1259    16406    transfer_history_id_seq    SEQUENCE     y   CREATE SEQUENCE transfer_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transfer_history_id_seq;
       public       token    false    7            �            1259    16408    transfer_history    TABLE     �   CREATE TABLE transfer_history (
    id integer DEFAULT nextval('transfer_history_id_seq'::regclass) NOT NULL,
    number_times numeric,
    id_task character varying,
    time_transfer date,
    th_hash character varying,
    sended_tokens text
);
 $   DROP TABLE public.transfer_history;
       public         token    false    178    7            �            1259    16421    wallet    TABLE     �   CREATE TABLE wallet (
    id_wallet integer DEFAULT nextval('id_wallets_seq'::regclass) NOT NULL,
    id_wordpress integer,
    address_wallet character varying(42),
    private_key character varying(64)
);
    DROP TABLE public.wallet;
       public         token    false    175    7            �          0    16461 
   new_wallet 
   TABLE DATA                     public       token    false    182   �!       �          0    16392 	   task_data 
   TABLE DATA                     public       token    false    176   c"       �          0    16399    task_history 
   TABLE DATA                     public       token    false    177   �1       �          0    16408    transfer_history 
   TABLE DATA                     public       token    false    179   �2       �          0    16421    wallet 
   TABLE DATA                     public       token    false    180   m>                  0    0    id_new_wallet_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_new_wallet_seq', 8, true);
            public       token    false    181                       0    0    id_task_data_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_task_data_seq', 38, true);
            public       token    false    173                       0    0    id_task_history_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('id_task_history_seq', 4, true);
            public       token    false    174                       0    0    id_wallets_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('id_wallets_seq', 6, true);
            public       token    false    175                       0    0    transfer_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('transfer_history_id_seq', 911, true);
            public       token    false    178            {           2606    16427    task_data task_data_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data
    ADD CONSTRAINT task_data_pkey PRIMARY KEY (id_task_data);
 B   ALTER TABLE ONLY public.task_data DROP CONSTRAINT task_data_pkey;
       public         token    false    176            }           2606    16429    task_history task_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id_task_history);
 H   ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
       public         token    false    177            �           2606    16431 &   transfer_history transfer_history_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY transfer_history
    ADD CONSTRAINT transfer_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transfer_history DROP CONSTRAINT transfer_history_pkey;
       public         token    false    179            �           2606    16449    wallet wallets_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY wallet
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id_wallet);
 =   ALTER TABLE ONLY public.wallet DROP CONSTRAINT wallets_pkey;
       public         token    false    180            ~           1259    16434    id    INDEX     =   CREATE UNIQUE INDEX id ON transfer_history USING btree (id);
    DROP INDEX public.id;
       public         token    false    179            �   �   x�Eʽ
�0 �O��:$��^pJ�R�V��	������:���7�zZb�Kq������EqH㟥�)]�v��r=<��#�'b�k�E������UR�h�11�1[--(��T+�lU��Mm���JbpD�l5�'T��1�B��ԸZ; �}����j�|2˲�z*6�      �   �  x��ˎ%7r��z�Bo4T�`��W^�B� �o��+F�n��n�~wl	F�2o��q�&թ�(2����o�����O/�|��|�\?��ݨ��������ח�������__~}����~��?9__��?���]�������~�����:���������O������&_�q���~�҇����H�>~�������~�˗���������/�����|�]H�/_��������7�7�sl��4�TW�w�[y��G��,=�7�o~���|S�V�ab)����ߔ�a��s���X���gW�;������|(�K�\�I�R.MM�f�%/Y4�x�Jr�ʡ��W��r����,���E{�q�P�~�P��ܒx\W�f�q�(�����[�)Kt��j�+���k̽k(�Z��!���z��RS,9�!���:�$б0�Z���C9�ӣ���u�̼��#�ՍvבXs�f)� vܧ��?|7�i���t!��Mc��Mg��r�=�ڻ;��l�?�M�8+�.~��VMMzml0�ދ$i^���9s�5�.=Ѯ���3�$"�xZ�$�2�X˛�#.�k�i�Yw���H�,2w��ki��늲�8i�d!�Z]C�Xȫwo�J��y.$�uuj|�\Uk�j�f/MA�y���?Z���FqˉP1�jWhNC#y���M��Z��p5g�4�bWIbm�.���P�q,����ߖk5�8Uj��W�m�XB��@��K��\��.�d�r*#�� K 0��� �l�N�����#p�����٥k_cZ�d�Ÿ:��k>mx*���ߖ[c��)RW��[�����e ��V�+N�wJ�$JW*,�Z�Y멤�AlL��<N��G?�!?�����>�SacN&�<EW�H�%��r1ԡ�r^��l�]+��pp�\�"`��P�X=�iu��z}&~r��\�$��X�$�W�s�9��S!Z�(Q�k��e�Q�)Z49���3�k�p,��`��S�v&ӭ�`{�R�_�I��-w��ϊ���۬�Yu�Z�c̕GV����Bq��~'��YN�-�]$��\f
+fi�7�t �r�Z	��/��>��Z��*ytS�Ԑ��֎� K ��Я"�G-=�@�ˢca�2����%כ�S9���H����`�a%J����\�mvߘ���\t�!���Ḓ8X���p��Ts�f5測����;�0<=)~�"���ܖ0Ӑ�
���:λ���# L�CX�`Ng,����8!+��9v��rΕ��13��V�a��s�.��U�N���+=��G��ȧZ��n��?��!-��<AĻ����/`�'������j8=�BXZ���jA�f��Z�/������N"�ϒZ.���S㜘�P�ZѬY�Y�!0�W�[w	��q�imq��Q�­C��� ��
�l痡ML�8�� (�r.#��%���s���hh��S�s��R5p5�\�r���K	��y(���l7 �7����ǵ ����_a[�r	7���o6[s�MDRZ�9�ݲ��HlZm3^9*����!>ߌĨ��+�'���Q�(�cX��
��s9-���:� =Vʕ03&#���ukld�J�r�e0��F��20e�h^�7����6eQ�~4�9���M��/����fF��;�Rg�}@dst�j����H��亴͍�.�c� ��m�����S1@�ۮ�mD���WP����,e�X⍸�zJ?���(׭����L�W<�"����Bg�S�g��B��p��ڹ��'�6��dQ�����	�OӺ�Ra.;�Kd��k�2	�>��*A ��a��f�#F�Y�T����A�Y�<���2���������k�T�G�r���N�^ϡ��!�	w�Ÿ�+���q��P���\' c����%�b=����a9/Xx����s�(w;����U�؁��q-u����u��i�8o�μ���+j7'3�n9��,�N2u�����\��H��x���`�c�:Kӡ97�� �d�Ʊ�۹c�j�E�p�1�����k���&8�}�r^]$;�r��$��aP{B�3��R��=a}��vʐ�"���h��w���BZ�@ �&�iz�k=��d�q#�]H,��@�U�D5|S�=�2���ɺd�e�/P'�ŀ ;#�aRY$?,t�˱c�\��x��Km�fD	�#�TR�l��j���m�S�����v�"�{2iԍP���"QGH���ˑC���V{`Du��b����*F���l �CN��S�Gu5%��9��}���))LU���\�(Qъs9��NV�m�FZ͐wj>ڞLE��G�5;?���c&܍_���	�j5N�?�p�d��ݗ3/�I�7OS_� �������HM�s?�t����D�5��V`!�ҬZj��
8<��?�����EJz�d7�&��Az�Z�3���c��PP�]��	�b�	]~� �F2��כKca0\��>�f)��Dh�:]�r$.��[�C�.���Y��i��K�Qq� @���.߉�$7>�0�r���sx�e���;)#O�
5ӽW�-� �e��X�8 r�[�֍ڻ���љ���y��`L���t�i8�L}y$h>^)���)KՊ�a�7ݘ�4Li6����������5���1�{��#f��}��`�*�ޏG�K�
4�"Z�ʌ�N\tK���u-�4[��}.�� M��� �"č�vx ~@D��V7��c�8F��q�3��,o+�}W�B+���y��H
�#O�=�&�<ON3�hGeM��o���fm'�c9�A�t�X�(��,�Na"�<�b%���6���G�������=ǶVv=r}`�F)x��2asOtH��v�吴�Ћ/���:/ύ���nb�I��
Q|H	�'���'�rf�i�L���p��I<��y��Q�2���9�*}��-�t�dr�X;F.A�ø�u��8��/)u�\���Y"�\"�5�]3����&��:�TNpљ���q����w2Q\�Y!z��D֍��x�i�H����I�R��@�呀��.ޘB�0���X�H���F��ub�sk��}�JR���!<U���݃�R*>��ڏ�}�*8�1X#<��~�tќ����MD��U�#�:^ڷ_��m�3�k�Tn�0��[���t�Q"��Z���kD��w��N7�P1��cBM��ܑ��ĨWYxM�K��T�䱓`�R�&׃D.��Cs�wB��o��P"�?���c��^˭�L-p�0�{��1l��dM�y␎�#@g�inXGW���jb��p��
˧�p�Q͝��'��b�r\aH�jZ_6�!aH	�.��\Dt^<�Ӽ�Y�&�v�M�۬�!�M�1���`��Յ���2\�����1��Q�D�j��V9ͩ�������˧�V�x7o��C#&��힏�D=�����>�t, �^�s�ɖ�^��,�O�;���R��弟}��Ρ�m*����h���&�Da��n���=�٤�v�e��t��iR�V�C�M�ӛS�ֵ�~CDi�D��jߏ<j��g�!�<�� ��nC[nS�cU�Ȱn"c�q�����`;�=��(��}Cx����T�u-�1�	2L�E�u�OksL��i��m�u;��}��'>���R���3`�	LG��_��|��7H���U2��� ��v��_���Rފ�#(��e�yxﰮ��«��חU��|��K�_���?��/������������R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R�R���JI �A��-�Y��������J�B/���߾R��W�=N&      �   �   x�M�A�0��⽩����6:u� �AjW���3�I��ҡ����TM[^;���^���X�_��E�����~s;�W�_vrnW�-��`2z�n�/[H
q����9��@.2"�g�ɨ/� ��q��͘��CҰ(�8&���:=EQ�=F7u      �   �  x���K�����������Z]���`�)�l��Tɖ�H�#E��y�س������V����?�|������������w�_?���^�z߼|��ϛ�}z����yy�~Z�޼��o߾{�n��{��j�q�������o������f�o^қ�/_���������7���z��K~\R�o�~SJ|�~�]��v���XiE�l��يY�T��귮ڪ�i9�;n-���눧�7�V��=VV��Kneg����Qdd���7]��{t���/��T)�'/_��)ٔ���hn��%ij*���-���g���9�[Dk�����ΰ\n�]'g={���d��V��CS�e�r��e����ꌣ����}��7���R��J�d���ў_�>�\=~�[�;x�Y
u6n�$
��O{�\��٭�~�e)��9��99�j��g���Uv_c��6o��93��K�Q�歞A����rMm���,�6Ҡ��Z<Ջ������֎���o������y��ʥ�����%�okS��9E��_j=�.k����%���ݘ��g������;��xMKR��s�4���[4�d�y��B�̗�����y�Jq����ѽ��wpb�}m�}V����&��hdCǼ��D�=���k��ݾhTQy0�YK����ӎ_�
l�����Q�_)���i�Ǳ[��UK�����x�=pt�Ϙv%�V�5�}��<���E]�{��r2�a�����)��uc�V�'p��u�p��40��׏�x��떺䓸��4�2F��fn6e��sE�ϻRn��i ��*--����ɐ�J��c@*9i�Ꝍ�WEO�u��Bej�eÏs��^mvU����r�T�gW~M�O�i�z״a]���E~8
��h�v2Bq�O��٧k��)Lh�"9w��}��N}:%V���g�l��F�6�4k*� ��[B��P%��S���3�Ԙ��
(�h�'� �kw9������Z�퉑����|���g^�9�w��,�Fer%����ԞP�%��=��nF��O�4��P��.c��`0�+XB��ZՆ2̔�E��x�e�m�K���6ߨ1�T�M,㑌��ZV&������ޤ𴭳��B��K:��7�(_�^o��*Lgڣ.���v�zݹ)dY:��2�bv�+j�Y\�E��(Y��]B37�����˯���w�1g\9�qc6�H_m�����FNI`��<Hv'�v��ۦ&�P������ ~�8��vw�`��M:��z�e�U�{i�1o���$�9C��R���PZ�!�!=9f�ĺ辷���h��J�@���ކ{b����!��=�-0e���.�M�� '��Ƚ�<�X�����Hhvk��:�/��� �@2B�ӄ�=e���h��oj�uB�h�j�,Z8�Lp������;f��d�bm�U��qV'(���N����S�J#oC����@WCkM�r2D5�F�\f�(�u���@ziBĈ���l.�B��t�q��Z�4"9pt����$��>�0	���rjq�G�	X5��I��-�����Nx^���c;���L`���q�� g�[�g]��3�nXQ3��P�������Bpy�5"���6Ս�`��$% b7��gZ�Պv�V'� =8*����Ǔ7G�Nlx�L��i�!������bH)��a�lE��X�m*�o%az-��$��#Jo!3�68��k�D�	�*r_Q��F��`�*ċ��	��$�W�Ҏ��ig��"b�fߵ��}�pF�A �MFIP)m�3�㾝 ��0{}!rK�mk���Z#�`��;�CH�!��F��u1�6F�+Q`3wL�\J�/�G��؅eb�%��T�����Y~cZ� �"S�}��3���gzl鐩��^{T�b��ow��`�6�k	͢�g�(m���dY��X �5�Z�a��=f��"�"�D�0�K�``f�8 䩵�Ä0}�,�bo:7O��!�#�qd�
f� ��=W�g!l$o�K��4�܌z9�1�	��2&�vRSExQ�`�UK��:���!�LP��.�۱L�}��4��L7@-(8Y�
�nR˲�Sk���i��q�<:{���%[�D�N��,�"YB�3{��8Q.C��ڹa��2��}��Qº`PPh���O����O�%A1[GX4s��x���˟l̸r��ƌ8��xY��cVHL����l�{���A,r�4c�P��=V���1/V�^0��RX���l�[k��Z��n.��p���E�
	Tb�a}��,0VA0�G�ڎy����l�0RzA=ZМ9�+�!#	Ӛ91#��(���k��^aEg����Z7���wQ��	σ��h��p�F���y&��M�������Wt-Ӫ��B*�dF fkna�-�w8�Q���gBď�6)H؅���t7
��R�i�pl�J�L8A���[;���\�ʑ���ޡ�J�n I\���<;+%�O�����"��V6'/z1�8�: S�G�%�/V�m/�gAo=>>y��F�F�@���o���7�����Vv�����b�f�굑V,�=�ю��+��4�<US]��<ҴAc�aC�F���$�
���n����"f@���HT���a4����ٙ�mW:4{ ��
�:1BnqV��@�d@8����S ���?�g.�a�M<LG$&$�(K�F�6�/�hbS�O��H���T�f?���)e	]������e����MC�/u�ʃ}c�k���Sa�,�ݜ#?�I�QO,&��Q�.�jdF�V�}��^+;n���2x:�(���3�4p��Y�{X���x�<��	pN�a�d �z��q�.��	����yl�xD|z@_��/6{��)�%��F}��zR�@�����Z�i3`gecY��U���h�l���_|�!�      �   �   x�=ʽ
�0@�Oq���!��i�S�ހ 
���h"J�^Ep���Ū�M�U����x�l��|y��e��k>�/��2w��)�rؙ�Z�d���=�V~�ZE�B)��i��C�Y���*��ԔN���3�Q�jG5nIqGNJBe\e�L�JDim��(�F�i>O���N9f     